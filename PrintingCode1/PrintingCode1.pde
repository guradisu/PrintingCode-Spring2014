/*  Properties
_________________________________________________________________ */

import processing.pdf.*;

// Set these variables to the print size you want (in inches)
// The resulting PDF will be this aspect ratio
float print_width = 5;
float print_height = 10;

// This will help make the sketch window bigger
float make_bigger = 100;


/*  Setup
_________________________________________________________________ */

void setup()
{
  size(round(print_width * make_bigger), round(print_height * make_bigger));

  beginRecord(PDF, "grab.pdf"); 
  background(255);
  smooth();
  
  
  translate(0,50);
  //strokeWeight(15);
  noStroke();
  fill(0); 
  ellipse(width/2, height/4, 400, 400); 
  
  noStroke();
  fill(255);
  triangle(width/2, height, 0, height/2.8, width, height/2.8);
  
  // cone
  noStroke();
  fill(0);
  int conewidth = 330;
  
  for (int i=int(height/2.6); i<height/1.2; i=i+20){
    for (int j=int(width-conewidth)/2; j<=int(width+conewidth)/2; j=j+20){
      rect(j,i,15,15);
    }
    conewidth-=13;
  }
  
  endRecord();
}
