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

PShape[] wetsharp = new PShape[10];

/*  Setup
_________________________________________________________________ */

void setup()  {
// CANVAS PROPERTIES
  size(round(print_width * make_bigger), round(print_height * make_bigger));

  beginRecord(PDF, "grab.pdf"); 
  background(30);
  smooth();  
  
  // DESIGN PART 
  translate(width/2, height/2.3);
  float x, y, wetX, wetY, sharpX, sharpY;
  int circlerad = 100;
  float droop;
  float angle = -1.3*PI;
  float angleinc = 0.7;
  
  stroke(255);
  fill(255);

  for (int i=0;i<10;i++){  
  wetsharp[i] = createShape();
  beginShape();
  while (angle <= 0.7*PI){
    x = circlerad * cos (angle);
    y = circlerad * sin (angle);
    if (angle<= 0.3*PI){
      vertex(x,y);
      angle += angleinc;  
    } else {
      float xdist = abs(x-width/2);
      //float multiplier = map(xdist,0,
      println(xdist);
      droop = random(0,xdist);
      curveVertex(x,y+droop);
      angle += 0.05;
    }
  } 
  endShape(CLOSE);
  }
  
  
  
  endRecord();
}
