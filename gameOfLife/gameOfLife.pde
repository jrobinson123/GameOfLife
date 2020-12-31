

GOL gol;
Cell[][] cells;
int size;
int cols;
int rows;

void setup(){
  size(800,600);
  frameRate(10);
  rectMode(CORNER);
  size = 10;
  cols = width/size;
  rows = height/size;
  cells = new Cell[cols][rows];
  gol = new GOL();
}

void draw(){
  gol.display();
  gol.update();
}
