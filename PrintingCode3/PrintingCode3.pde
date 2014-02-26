/*  Properties
_________________________________________________________________ */

import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

import processing.pdf.*;

// Set these variables to the print size you want (in inches)
// The resulting PDF will be this aspect ratio
float print_width = 14;
float print_height = 20;

// This will help make the sketch window bigger
float make_bigger = 40;


/*  Setup
_________________________________________________________________ */

void setup()
{
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  beginRecord(PDF, "grab.pdf"); 
  
  background(30);
  smooth();
  
  colorMode(HSB, 1, 1, 1);
  
  TColor col = TColor.newHSV(random(0,1),1,1);
  ColorTheoryStrategy analogous = new AnalogousStrategy();  
  ColorTheoryStrategy complementary = new TriadTheoryStrategy();
  
  ColorList acolors = ColorList.createUsingStrategy(analogous, col);
  ColorList moreaColors = new ColorRange(acolors).getColors(null,50,0.05);
  
  ColorList ccolors = ColorList.createUsingStrategy(complementary, col);
  ColorList morecColors = new ColorRange(ccolors).getColors(null,10,0.1);
  
  noStroke();
  int dice = 0;
  TColor c = moreaColors.get(int(random(1,50)));
  
  for (int down = 20; down <= height-20; down += 30){
    for (int across = 10; across <= width-10; across += 10){
      dice = int(random(1,10));
      if (dice < 7){
        c = moreaColors.get(int(random(1,50)));
      } else {
        c = morecColors.get(int(random(1,10)));
      }
      fill(c.hue(), c.saturation(), c.brightness());
      ellipse(across+random(-1,1),down+random(-1,1),2+random(-1,1),20+random(-1,1));
    }
  }
  

  
  endRecord();
}
  
