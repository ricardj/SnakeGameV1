GameBoard gameBoard;

void setup(){
  
  size(0,0);
  surface.setResizable(true);
  surface.setLocation(300,100);
  
  print("Initialising Snake game");
  
  gameBoard = new GameBoard();
  
}

void draw(){
  gameBoard.update();
  gameBoard.render();
}
