/*  Assigment:
Write a Processing sketch that outputs 2 shapes on a page. 
The first shape should be inspired by the word “wet”. 
The second shape should be inspired by the word “sharp”. 
Use only black and white. You have to use beginShape(), 
and all vertex points have to be created in a for loop. 
No manual plotting. Print on a poster at AMS and bring to class 
for design critique. */

import processing.pdf.*;

// Set these variables to the print size you want (in inches)
// The resulting PDF will be this aspect ratio
float print_width = 8.5;
float print_height = 10;

// This will help make the sketch window bigger
float make_bigger = 80;


/*  Setup
_________________________________________________________________ */

void setup()  {
// CANVAS PROPERTIES
  size(round(print_width * make_bigger), round(print_height * make_bigger));

  beginRecord(PDF, "grab.pdf"); 
  background(30);
  smooth();  
  
  // DESIGN PART 
  float x,y;
  float xdist = abs(x-width/2);
  
  y=height/1.3;
  fill(255);
  
  beginShape();
  
  for (i=0;i<=1;i++){
    while (x<=width){
  }
  
  
  endShape(CLOSE);
  
  endRecord();
}
