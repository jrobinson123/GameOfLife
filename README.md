# GameOfLife
My rendition of John Conway's Game of Life. Cells are considered either dead(displayed as white)  or alive(displayed as black). Every cell has 8 neighbors. The new value of a cell is based on its current value as well as the value of its neighbors. 

# Dependencies
I wrote this program in Processing 3 with no external libraries. 

# Usage
Clone or download my code. From you computer you can play the game by opening one of the .pde files and pressing the play button in the Processing environment. You can also the export the application as a double-clickable executible on Mac or PC by pressing File/Export Application in the Processing environment.

# Explanation
Individual cells are represented by through the Cell class. Cells are kept in a 2D-Array called cells. The length of the 2D-Array cells is dependent on a specified size. The larger the size, the more pixel space each individual Cell object will take up and the less total Cells will be required to fill up the screen. 
```processing
size = 10;
  cols = width/size;
  rows = height/size;
  cells = new Cell[cols][rows];
```
As an argument each cell takes in an x and y value and a boolean that indicates whether or not it is alive. The x and y variables indicate the x and y index of the Cell in cells. The x and y variables are also used to calculate the x and y position of the Cell. The neighbors array stores the indices of the neighboring Cells. 
```processing
class Cell{
  PVector pos;
  int x;
  int y;
  boolean alive;
  boolean newState;
  PVector[] neighbors;
  Cell(int x, int y, boolean alive){
    pos  = new PVector(x * size, y * size);
    this.x = x;
    this.y = y;
    this.alive = alive;
    neighbors = new PVector[8];  
    initializeNeighbors();
    
  }
```

