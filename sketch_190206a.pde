static final int GAME_WIDTH = 1000;
static final int GAME_HEIGHT = 1000;
GameBoard gameBoard;


void setup(){
  
  
  print("Initialising Snake game");
  
  PVector gameSize = new PVector(GAME_WIDTH,GAME_HEIGHT);
  gameBoard = new GameBoard(gameSize);
  
}

void draw(){
  gameBoard.draw();
}
