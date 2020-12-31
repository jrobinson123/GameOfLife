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
The initializeNeighbors method is what is used to populate the neighbors array for each Cell. Three local variables are used in this method. The first is index which represents the index of the neighbors array that we need to modify. Index starts at zero and will increment everytime an element in neighbors has been defined. We also must use tempX and tempY in order to find the x and y value of each neighboring Cell and then put those values into a new PVector in neighbors. 
```processing
void initializeNeighbors(){
    int index = 0;
    int tempX;
    int tempY;
 ```
 The neighboring Cells we are looking at are to the left, right, up, down and diagonals of the original Cell. So therfore each of the x and y indcies of each neighboring Cell can be represented as a for-loop from y - 1 to y + 1 nested inside of a for-loop from x - 1 to x + 1. 
 ```processing
    for(int a = x - 1; a <= x +1; a++){
      for(int b = y - 1; b <= y + 1; b++){
 ```
 However this doesn't properly account for edge cases. For example if the x value of the original Cell is 0, then some of the neighboring cells will have an x-coordinate of -1 which doesn't exist. To account for this, I wrote an if-statement that re-routes non-exisitent values to "wraparound the screen" for example changing tempX = -1 (the neighbor of 0 to the left) to tempX = Cols - 1(the rightmost x position). If no edge case exists then tempX and tempY are simply set to the itereable in the loops(a and b respectively). 
 ```processing
      if(a == -1){
        tempX = cols - 1;
      }else if(a == cols){
        tempX = 0;
      }else{
        tempX = a;
      }
      if(b == -1){
        tempY = rows - 1;
      }else if(b == rows){
        tempY = 0;
      }else{
        tempY = b;
      }
 ```
 Finally because a Cell can't be a neighbor with itself, neighbors will only be added to when the values of a and b are not equal to x and y.
 ```processing
   if(!(a == x && b == y)){
     neighbors[index] = new PVector(tempX,tempY);
     index++;
   }
 ```
The update method in Cell first determines how many of a Cell's neighboring Cells are alive by iterating through neighbors.
```processing
void update(){
    int numOfAliveNeighbors = 0;
    for(PVector p:neighbors){
      if(cells[(int)p.x][(int)p.y].alive == true){
        numOfAliveNeighbors++;
      }
    }
 ```
 Based on Conway's rules for the Game of Life. The Cell will calculate whether it will be dead or alive the next frame. This value is stored not in alive but a seperate variable called newState. The reason a new temporary variable must be used is because since the new value of alive depends on other Cells, we can't have some Cells update their values before others. 
 ```processing
 if(alive == true){
      if(numOfAliveNeighbors < 2){
        newState = false;
      }else if(numOfAliveNeighbors > 3){
        newState = false;
      }else{
        newState = alive;
      }
    }else{
      if(numOfAliveNeighbors == 3){
        newState = true;
      }else{
        newState = alive;
      }
    }
 ```
 A seperate method called change is used to finally update alive to be equal to newState.
 ```processing
   void change(){
      alive = newState;
    }
 ```
