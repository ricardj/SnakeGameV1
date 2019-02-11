class FinalDisplay{
  
  private final static int DEFAULT_DISPLAY_WIDTH = 400;
  private final static int DEFAULT_DISPLAY_HEIGHT = 200;
  
 
  private GameBoard parentGameBoard;
  
  FinalDisplay(GameBoard parentGameBoard){
    this.parentGameBoard = parentGameBoard;
  }
  
  
  public void render(){
    fill(200);
    rect(parentGameBoard.screenSize.x/2-DEFAULT_DISPLAY_WIDTH/2, 
         parentGameBoard.screenSize.y/2-DEFAULT_DISPLAY_HEIGHT/2, 
         DEFAULT_DISPLAY_WIDTH, 
         DEFAULT_DISPLAY_HEIGHT, 
         7);
    fill(50);
    
    textFont(parentGameBoard.mainFont);
    textSize(40);
    textAlign(CENTER);
    text("Time is out!",parentGameBoard.screenSize.x/2,
                        parentGameBoard.screenSize.y/2-DEFAULT_DISPLAY_HEIGHT/5);
    textSize(20);
    text("You have eaten "+parentGameBoard.getEatenWorms()+ " worms.",parentGameBoard.screenSize.x/2,
                                                                      parentGameBoard.screenSize.y/2+DEFAULT_DISPLAY_HEIGHT/4);
    
  }
  
}
