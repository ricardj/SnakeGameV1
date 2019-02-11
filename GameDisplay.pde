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
    textSize(32);
    textAlign(LEFT);
    text("Food: " + (int)eatenWorms, 10,40);
    text("Time: "+ (int)timer, 10, 70);
  }
  
  public void update(){
     eatenWorms = parentGameBoard.getEatenWorms();
     float currentTimeSeconds = millis()/1000;
     timer -= (currentTimeSeconds-previousTimeSeconds);
     previousTimeSeconds = currentTimeSeconds;  
  }
}
