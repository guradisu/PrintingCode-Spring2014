/*
Quad color scheme for four lines
set up margins: if next jump goes beyond, take reverse direction
weighted random: which direction. the farther from center, 
the more likely to head back to center
*/

import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

import geomerative.*;

import processing.pdf.*;

PVector[][] lines;
PVector currentLine;

// Print settings:
float print_width = 12;
float print_height = 16;
float mult = 55;

/*  Setup
_________________________________________________________________ */

void setup()
{
  size(round(print_width*mult), round(print_height*mult));
  
  beginRecord(PDF,"olivetti_.pdf");
  background(237, 231, 217);
  //smooth();
  colorMode(HSB,1,1,1);
  
  RG.init(this);

  // STYLE SETTINGS
  strokeCap(ROUND);
  strokeWeight(18);
  noFill();
 
  // COLORS
  TColor red = TColor.newHSV(0.02, 0.83, 0.83);
  TColor blue = TColor.newHSV(0.53, 0.75, 0.65);
  TColor yellow = TColor.newHSV(0.14, 0.84, 0.94);
  TColor green = TColor.newHSV(0.37, 0.38, 0.57);
  
  ColorList colors = new ColorList();
  colors.add(yellow);
  colors.add(red);
  colors.add(blue);
  colors.add(green);
  
  // MARGINS
  
  float margin = mult;
  float actualCanvasWidth = width - 2*margin;
  float actualCanvasHeight = height - 2*margin;
  
  // GENERATE POINTS, WEIGHTED RANDOM DIRECTION, NOISE RANGE
  // potential idea: can use #chars in word to determine #points.
  
  float weight;
  int words = 4;
  int chars = round(random(4,5));
  lines = new PVector[words][chars];
  for (int i=0;i<words;i++){
    for (int j=0; j<chars;j++){
      lines[i][j] = new PVector();
    }
  }
  
  float hue = 13;
  
  //case for first point
  for (int i=0; i<words;i++){
    lines[i][0].x = random(margin, width/2-margin*2);
    lines[i][0].y = random(margin+300, actualCanvasHeight+margin);
       
  //case for following points
    for (int j = 1; j < chars; j++){
      
      weight = random(0,1);
      float xIncrement = random(50,200);
      if (lines[i][j-1].x + xIncrement < actualCanvasWidth+margin){
        lines[i][j].x = lines[i][j-1].x + xIncrement;
      } else {
        lines[i][j].x = lines[i][j-1].x - xIncrement;
      }
      
      float yIncrement = noise(1)*mult;
      weight = random(0,1);
      if  (lines[i][j-1].y + yIncrement < actualCanvasHeight+margin && weight>0.3){
        lines[i][j].y = lines[i][j-1].y + yIncrement;
      } else {
        lines[i][j].y = lines[i][j-1].y - yIncrement;
      }
      
    }
  }
    
  
  // DRAW CURVES, HOW DETERMINE CURVES?
  
  for (int i=0;i<words;i++){
    TColor c = colors.get(i);
    stroke(c.hue(),c.saturation(),c.brightness(),200);
    for (int j=0;j<lines[i].length-1;j++){
      RShape line = new RShape();
      line.addMoveTo(lines[i][j].x, lines[i][j].y);
      if (lines[i][j].x < lines[i][j+1].x){
        line.addBezierTo((lines[i][j].x+lines[i][j+1].x)/10*4, (lines[i][j].y+lines[i][j+1].y)/2-random(150,250), (lines[i][j].x+lines[i][j+1].x)/10*6, (lines[i][j].y+lines[i][j+1].y)/2-random(150,250), lines[i][j+1].x, lines[i][j+1].y); 
      } else {
        line.addBezierTo((lines[i][j].x+lines[i][j+1].x)/10*6, (lines[i][j].y+lines[i][j+1].y)/2-random(150,250), (lines[i][j].x+lines[i][j+1].x)/10*4, (lines[i][j].y+lines[i][j+1].y)/2-random(150,250), lines[i][j+1].x, lines[i][j+1].y); 
      }
      line.draw();   
    }
  }
  
  // OVERLAID TEXT AND BLACK DOTS
  
  RFont arial = new RFont("Arial-Bold.ttf",15,RFont.CENTER);
  
  
  for (int i=0;i<words;i++){
    for (int j=0;j<lines[i].length;j++){

      stroke(0,0,0);
      point(lines[i][j].x, lines[i][j].y);
      
      noStroke();
      fill(0,0,1);
      
      pushMatrix();
      translate(lines[i][j].x, lines[i][j].y+5);
      char alphabet = (char) int(random(65, 90));
      println(alphabet);
      arial.draw(String.valueOf(alphabet));
      popMatrix();
    }
  }

  endRecord();
}
