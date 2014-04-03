/*  Properties
_________________________________________________________________ */

import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

import processing.pdf.*;

// Set these variables to the print size you want (in inches)
// The resulting PDF will be this aspect ratio
float print_width = 16;
float print_height = 11;

// This will help make the sketch window bigger
float make_bigger = 40;


/*  Setup
_________________________________________________________________ */

void setup()
{
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  beginRecord(PDF, "grab.pdf"); 
  
  colorMode(HSB,1,1,1);
  strokeWeight(2);
  
  TColor backc = TColor.newHSV(1,0.005,0.98);
  TColor cutc = TColor.newHSV(1.04,1,1);
  background(backc.hue(), backc.saturation(), backc.brightness());


// H
  pushMatrix();
  translate(180,0);
  noFill();
  stroke(0,0,0.2);
  ellipse(width,height/2, 17*make_bigger, 17*make_bigger);
  pushMatrix();
  translate(width/2, height/2);
  ellipse(0,0.65*make_bigger, 2.3*make_bigger, 2.3*make_bigger);
  
  fill(backc.hue(), backc.saturation(), backc.brightness(), 200);
  noStroke();
  rect(-1.3*make_bigger, 1.1*make_bigger, 31, -20*make_bigger);
  rect(-1.1*make_bigger, 1.1*make_bigger, 1000, 20*make_bigger);
  
  stroke(cutc.hue(), cutc.saturation(), cutc.brightness());
  line(-1*make_bigger,1.1*make_bigger,400,1.1*make_bigger);
  popMatrix();


  popMatrix();


// G
  pushMatrix();
  translate(90,0);
  noFill();
  pushMatrix();
  translate(width/2, height/2);
  
  stroke(0,0,0.2);
  ellipse(-1.375*make_bigger, 0.93*make_bigger, 4.8*make_bigger, 4.8*make_bigger);
  ellipse(0,0.4*make_bigger, 1.8*make_bigger, 1.8*make_bigger);
  
  fill(backc.hue(), backc.saturation(), backc.brightness(),200);
  noStroke();
  rect(-1.06*make_bigger, -height/2, -5*make_bigger, 20*make_bigger);
  
  stroke(cutc.hue(), cutc.saturation(), cutc.brightness());
  line(-1.06*make_bigger, -19*make_bigger, -1.06*make_bigger, 19*make_bigger);
    
  popMatrix();
  popMatrix();

// D
  pushMatrix();
  translate(-200,0);
  noFill();
  
  pushMatrix();
  translate(width/2, height/2);
  
  stroke(0,0,0.2);
  ellipse(0,0, 3*make_bigger,3*make_bigger);
  popMatrix();
  
  fill(backc.hue(), backc.saturation(), backc.brightness(),200);
  ellipse(0,0, 19*make_bigger, 19*make_bigger);
  popMatrix();

// O
  pushMatrix();
  translate(-98,0);
  
  pushMatrix();
  translate(width/2, height/2);
  ellipse(0,0.4*make_bigger, 1.8*make_bigger, 1.8*make_bigger);
  
  
  popMatrix();
  popMatrix();


// U
  pushMatrix();
  translate(-3,0);
  noFill();
  
  pushMatrix();
  translate(width/2, height/2);
  stroke(0,0,0.2);
  ellipse(0,0.2*make_bigger, 2.3*make_bigger, 2.3*make_bigger);
  stroke(cutc.hue(), cutc.saturation(), cutc.brightness());
  line(-1.3*make_bigger, -0.55*make_bigger, 3.2*make_bigger, -0.55*make_bigger);
  
  fill(backc.hue(), backc.saturation(), backc.brightness(),200);
  noStroke();
  rect(-1.3*make_bigger, -0.55*make_bigger, 5*make_bigger, -height);
  
  popMatrix();
  popMatrix();



    
  endRecord();
}
