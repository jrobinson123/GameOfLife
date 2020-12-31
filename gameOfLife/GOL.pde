

class GOL{
  

  GOL(){     
    for(int x = 0; x < cols; x++){
     for(int y = 0; y < rows; y++){
        boolean alive;
        if(Math.random() > 0.50){
          alive = true;
        }else{
          alive = false;
        }
        cells[x][y] = new Cell(x,y,alive);
      } 
    }
    
  }
  void display(){
    for(int x = 0; x < cols; x++){
      for(int y = 0; y < rows; y++){
        cells[x][y].display();  
      }
    }
  }
  void update(){
    for(int x = 0; x < cols; x++){
      for(int y = 0; y < rows; y++){
        cells[x][y].update();  
      }
    }
    for(int x = 0; x < cols; x++){
      for(int y = 0; y < rows; y++){
        cells[x][y].change();  
      }
    }
  }
  
}

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
  
  void initializeNeighbors(){
    int index = 0;
    int tempX;
    int tempY;
    
    for(int a = x - 1; a <= x +1; a++){
      for(int b = y - 1; b <= y + 1; b++){
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
        if(!(a == x && b == y)){
          neighbors[index] = new PVector(tempX,tempY);
          index++;
        }
      }
    }
  }
  
  void display(){
    noStroke();
    if(alive){
      fill(0);
    }else{
      fill(255);
    }
    rect(pos.x,pos.y,size,size);
  }
  void update(){
    int numOfAliveNeighbors = 0;
    for(PVector p:neighbors){
      if(cells[(int)p.x][(int)p.y].alive == true){
        numOfAliveNeighbors++;
      }
    }
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
  }
  void change(){
    alive = newState;
  }
}
