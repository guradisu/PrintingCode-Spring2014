// Tuesday - try make own.

class GridSystem
{
  int cols;
  int rows;
  float gutterSize;
  float margin;
  Module[][] modules;
  float moduleWidth;
  float moduleHeight;
  float gridW, gridH;
  
  GridSystem(int _cols, int _rows, float _gutterSize, float _margin, float _gridW, float _gridH)
  {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    margin = _margin;
    gridW = _gridW;
    gridH = _gridH;
    
    modules = new Module[cols][rows];
    
    // cache the width of entire grid. Remember to cast as float, otherwise the columns will not line up
    // First we find the width of the page without the pagemargin
    float actualPageWidth = ((float)gridW - (2*margin));
    // then we find the gutter sizes. We subtract by 1 as the furthermost right module will not have a right-side gutter
    float totalGutterWidth = (cols-1) * gutterSize;
    // then we simply find the column size by subtracting the gutterwidth from the page size and dividing by number of cols
    moduleWidth = (actualPageWidth - totalGutterWidth) / (float)cols;
    
    // cache the height of each column. This is the exact same calculation as before, and we should probably put
    float actualPageHeight = ((float)gridH - (2*margin));
    float totalGutterHeight = (rows-1) * gutterSize;
    moduleHeight = (actualPageHeight - totalGutterHeight) / (float)rows;
    
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        modules[i][j] = new Module();
        modules[i][j].x = margin + (i*moduleWidth) + (i*gutterSize);
        modules[i][j].y = margin + (j*moduleHeight) + (j*gutterSize);
        modules[i][j].w = moduleWidth;
        modules[i][j].h = moduleHeight;
      } 
    }
  }
  
  void display()
  {

    // draw all modules
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        rect(modules[i][j].x, modules[i][j].y, modules[i][j].w, modules[i][j].h);
      } 
    }
  }
}
