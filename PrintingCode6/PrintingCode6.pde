import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

import geomerative.*;

import processing.pdf.*;

// Print settings:
float print_width = 12;
float print_height = 16;
float mult = 55;

// Meat angles:
float[] angleBase;
float angleVar; // the amount of variation
float angleRemain = 2*PI;
float[] angle; // actual angle randomly generated (angleBase +- angleVar)

// Meat lengths:
float[] radius;
float radiusBase; 
float[] weight; // tenderloin: weight = 1

// Meat coordinates;
int xMin, xMax;
int thickness;

/*  Setup
_________________________________________________________________ */

void setup()
{
  
  angleBase = new float[13];
  angleVar = 2*PI/20;
  angle = new float[13];
  radius = new float[13];
  xMin = 0;
  xMax = 0;
  weight = new float[13];
  
  for (int i=0;i<13;i++){
    weight[i] = 1;
  }
  weight[1] = 0.7;
  weight[10] = 0.7;
  
  // because angleBase[12] and angleVar[12] are necessarily equal, only need 12 iterations
  for (int i=0;i<13;i++){
    angleBase[i] = angleRemain/(13-i);
    if (i==0){
      angle[i] = random(angleBase[i]*0.9, angleBase[i]*1.1);
    } else {
      angle[i] = angle[i-1]+random(angleBase[i]*0.9, angleBase[i]*1.1);
    }
    angleRemain = 2*PI - angle[i];
    println(angle[i]);
  }
  println("-----");
  
  size(round(print_width * mult), round(print_height * mult));
  colorMode(HSB,1,1,1); 
 
  float a = 3*mult;
  float b = 1.5*mult;
  
  beginRecord(PDF,"grabmeat.pdf");
  background(0.045,0.46,0.92);
  
  // generate coordinates
  for (int i=0; i<13;i++){
    radiusBase = a*b/sqrt( sq(b*cos(angle[i])) + sq(a*sin(angle[i])));
    radius[i] = random(radiusBase*0.9, radiusBase*1.1)*weight[i];
    if (radius[i]*cos(angle[i]) < radius[xMin]*cos(angle[xMin])){
      xMin = i;
    }
    if (radius[i]*cos(angle[i]) > radius[xMax]*cos(angle[xMax])){
      xMax = i;
    }
  }
  println(xMin);
  println(xMax);
  
  thickness = int(random(-55,-22));
  
  translate(width/2,height/2);
  //rotate(random(0.2,-0.2));
  
  noStroke();
  fill(0,0.08,0.89);
 // meat shadow
  beginShape();
  vertex(radius[xMax]*cos(angle[xMax]),radius[xMin]*sin(angle[xMax])+thickness);
  for (int i=xMax; i != xMin+1;i++){
    if (i==13){
      i=0;
    }
    vertex(radius[i]*cos(angle[i]),radius[i]*sin(angle[i])); 
  }
  vertex(radius[xMin]*cos(angle[xMin]),radius[xMin]*sin(angle[xMin])+thickness);
  endShape(CLOSE);
 
 // meat surface
  fill(0,0.04,0.98); 
  translate(0,thickness);
  beginShape();
  for (int i=0;i<13;i++){
    vertex(radius[i]*cos(angle[i]),radius[i]*sin(angle[i])); 
  }
  endShape(CLOSE);
  
  // meat center
  fill(0.995,0.75,0.66);
  float rind = random(0.8,0.92);
  translate(0,-5);
  beginShape();
    for (int i=0;i<13;i++){
    vertex(rind*radius[i]*cos(angle[i]),rind*radius[i]*sin(angle[i])); 
  }
  endShape(CLOSE);
  
  endRecord();
}
