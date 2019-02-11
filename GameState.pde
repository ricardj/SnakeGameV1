class GameState{
 
  public static final int INITIALIZING = 0;
  public static final int PLAYING = 1;
  public static final int END_GAME = 2;
  
  public int currentState;
  
  GameState(){
    currentState = INITIALIZING;
  }
}
