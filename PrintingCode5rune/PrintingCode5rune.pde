import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

import geomerative.*;

import processing.pdf.*;

// Print settings:
float print_width = 12;
float print_height = 16;
float mult = 55;


/*  Setup
_________________________________________________________________ */

void setup()
{
  size(round(print_width * mult), round(print_height * mult));
  background(230);
  beginRecord(PDF, "grab.pdf"); 
  colorMode(HSB, 1, 1, 1);
  

  RG.init(this); // initializes geomerative library
  
  
// Gridbase:
  float margin = print_width*mult/12;
  int colnum = 10;
  int rownum = 14;
  
  GridSystem gridbase = new GridSystem(colnum, rownum, 0, margin, width, height);  
  stroke(0.5638, 1, 0.73);
  noFill();
  //gridbase.display();
  noStroke();
  for (int i=0; i<rownum; i++){
    if (i % 2 != 0){
      fill(0,0,1);
    } else {
      noFill();
    }
    for (int j=0; j<colnum; j++){
      rect(gridbase.modules[j][i].x, gridbase.modules[j][i].y, gridbase.modules[j][colnum-1].x+gridbase.modules[j][colnum-1].w-gridbase.modules[j][0].x, gridbase.modules[j][0].h);
    }
  }
  
// Gridbook:  
  pushMatrix();
  translate(-width/2.1,-height/1.4);
  rotate(-0.45);
  GridSystem gridbook = new GridSystem(colnum, rownum, 0, 0, 1.3*width, 1.3*height);
  noStroke();
  fill(0.58,0.2,0.2);
  gridbook.display();
  
  // Type: author
  fill(0,0,1);
  noStroke();
  String author1 = "italo";
  String author2 = "CALVINO";
  
  RFont font = new RFont("Peignot-Demi-Normal.ttf", 125, RFont.LEFT);
  pushMatrix();
  translate(-3,gridbook.gridH);
  font.draw(author2); // tried to use gridbook.margin but it didn't align flush. WHY?
  popMatrix();
  
  pushMatrix();
  textSize(48);
  translate(gridbook.modules[0][rownum - 2].x, gridbook.modules[0][rownum - 1].y-4);
  rotate(PI/2);
  RFont peignot = new RFont("Peignot-Demi-Normal.ttf", 80, RFont.RIGHT);
  peignot.draw(author1);
  popMatrix();
  
  popMatrix();
  
  // Type: title
  String title1 = "If";
  String title2 = "on";
  String title3 = "a";
  String title4 = "winter's";
  String title5 = "n";
  String title5b = "ight";
  String title6 = "travel";
  String title6b = "er";
  
  RFont minion = new RFont("Minion-Italic.ttf",50,RFont.RIGHT);
  noStroke();
  fill(0,0.5,0.2);
  
  // if
  pushMatrix();
  translate(gridbase.modules[1][8].x+gridbase.modules[1][8].w, gridbase.modules[1][8].y);
  minion.setSize(40);
  minion.setAlign(LEFT);
  minion.draw(title1);
  popMatrix();
  
  // on
  pushMatrix();
  translate(gridbase.modules[0][9].x+gridbase.modules[0][9].w, gridbase.modules[0][9].y);
  minion.setSize(35);
  minion.setAlign(LEFT);
  minion.draw(title2);
  popMatrix();
  
  // a
  pushMatrix();
  translate(gridbase.modules[2][10].x+gridbase.modules[2][10].w, gridbase.modules[2][10].y);
  minion.setSize(30);
  minion.setAlign(RIGHT);
  minion.draw(title3);
  popMatrix();
  
  
  // winter's
  pushMatrix();
  translate(gridbase.modules[3][11].x+gridbase.modules[3][11].w, gridbase.modules[3][11].y);
  minion.setAlign(RIGHT);
  minion.setSize(46);
  minion.draw(title4);
  popMatrix();
  
  // night
  pushMatrix();
  translate(gridbase.modules[4][12].x+gridbase.modules[4][12].w, gridbase.modules[4][12].y);
  minion.setAlign(RIGHT);
  minion.setSize(42);
  minion.draw(title5);
  popMatrix();
  
  // a
  pushMatrix();
  translate(gridbase.modules[5][12].x+gridbase.modules[5][12].w, gridbase.modules[5][12].y);
  minion.setAlign(RIGHT);
  minion.draw(title3);
  popMatrix();
  
  // traveler
  pushMatrix();
  translate(gridbase.modules[6][13].x, gridbase.modules[6][13].y);
  minion.setAlign(LEFT);
  minion.setSize(50);
  minion.draw(title6);
  popMatrix();
  pushMatrix();
  translate(gridbase.modules[8][13].x-3,gridbase.modules[8][13].y);
  rotate(0.35);
  minion.draw(title6b);
  popMatrix();
  

  
  

  
  endRecord();
}
