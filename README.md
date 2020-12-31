# GameOfLife
My rendition of John Conway's Game of Life. Cells are considered either dead(displayed as white)  or alive(displayed as black). Every cell has 8 neighbors. The new value of a cell is based on its current value as well as the value of its neighbors. 

# Dependencies
I wrote this program in Processing 3 with no external libraries. 

# Usage
Clone or download my code. From you computer you can play the game by opening one of the .pde files and pressing the play button in the Processing environment. You can also the export the application as a double-clickable executible on Mac or PC by pressing File/Export Application in the Processing environment.

# Explanation
Individual cells are represented by through the Cell class. Cells are kept in a 2D-Array called cells. The length of the Array is dependent on a specified size. The larger the size, the larger each Cell will be and the shorter cells will be. 
```processing
size = 10;
  cols = width/size;
  rows = height/size;
  cells = new Cell[cols][rows];
```
