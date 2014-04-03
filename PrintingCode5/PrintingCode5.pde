import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

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
  background(30);
  beginRecord(PDF, "grab.pdf"); 
  colorMode(HSB, 1, 1, 1);

// Gridbase:
  float margin = print_width*mult/12;
  int colnum = 10;
  int rownum = 14;
  
  GridSystem gridbase = new GridSystem(colnum, rownum, 0, margin, width, height);  
  stroke(0.5638, 1, 0.73);
  noFill();
  gridbase.display();
  
// Gridbook:  
  pushMatrix();
  translate(-width/2.1,-height/1.4);
  rotate(-0.45);
  GridSystem gridbook = new GridSystem(colnum, rownum, 0, 0, 1.3*width, 1.3*height);
  stroke(1,1,0.73);
  fill(0,0,0.5,100);
  gridbook.display();
  
  // Type: author
  fill(0,0,1);
  String author1 = "Italo";
  String author2 = "CALVINO";
  textSize(100);
  textAlign(LEFT);
  text(author2, 0, gridbook.gridH); // tried to use gridbook.margin but it didn't align flush. WHY?
  
  popMatrix();
  
  textSize(48);
  textAlign(RIGHT);
  text(author1, gridbase.modules[8][2].x, gridbase.modules[8][2].y);
  
  // Type: title
  String title1 = "If on a winter's night";
  String title2 = "a traveler";
  textSize(32);
  fill(0,0,1);
  textAlign(RIGHT);
  text(title1, gridbase.modules[9][10].x+gridbase.modules[9][10].w, gridbase.modules[9][10].y);
  text(title2, gridbase.modules[9][11].x, gridbase.modules[9][11].y);
  

  
  

  
  endRecord();
}
