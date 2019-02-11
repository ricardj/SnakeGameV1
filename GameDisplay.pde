class GameDisplay{
  
  public static final float DEFAULT_INIT_TIMER = 60;
  
  
  private GameBoard parentGameBoard;
  
  //We will have a timer
  //And a food count
  public float timer;
  public float eatenWorms;
  
  //Auxiliar variables for time control
  private float previousTimeSeconds;
  
  GameDisplay(GameBoard parentGameBoard){
    this.parentGameBoard = parentGameBoard;
    timer = DEFAULT_INIT_TIMER;
    eatenWorms = parentGameBoard.getEatenWorms();
    previousTimeSeconds = millis()/1000;
  }
  
  public void render(){
    fill(#33B2D0);
    textSize(20);
    textFont(parentGameBoard.mainFont);
    textAlign(CENTER);
    text("Food: " + (int)eatenWorms, parentGameBoard.screenSize.x/4,50);
    text("Time: "+ (int)timer, parentGameBoard.screenSize.x/4*3, 50);
  }
  
  public void update(){
     eatenWorms = parentGameBoard.getEatenWorms();
     float currentTimeSeconds = millis()/1000;
     timer -= (currentTimeSeconds-previousTimeSeconds);
     previousTimeSeconds = currentTimeSeconds;  
  }
}
