class GameBoard{
  static final int GAME_WIDTH = 800;
  static final int GAME_HEIGHT = 600;
  
  
  private GameState stateMachine;
  
  public PFont mainFont;
  
  private PImage gameBackground;
  
  public static final int DEFAULT_LENGTH = 1;
  public static final int DEFAULT_WORM_EAT_OFFSET = 30;
  private PVector screenSize;
  private Snake snake;
  private GameDisplay gameDisplay;
  private FinalDisplay finalDisplay;
  private Worm currentWorm;
  
  GameBoard(){
    this.screenSize = new PVector(GAME_WIDTH,GAME_HEIGHT);
    surface.setSize(GAME_WIDTH,GAME_HEIGHT);
   
    gameBackground = loadImage("snakeGameBackground.png");
    
    mainFont = loadFont("SpyAgencyExpanded.vlw");
    
    initGame();
  }
  
  public void render(){
     
    switch(stateMachine.currentState){
      case GameState.PLAYING:
       //Draw background
       drawBackground();
       
       //Draw the snake
       snake.render();
       
       //Draw worm
       currentWorm.render();
       
       //Draw timer
       gameDisplay.render();
      break;
      
      case GameState.END_GAME:
       //Draw background
       drawBackground();
       
       //Draw the snake
       snake.render();
       
       //Draw worm
       currentWorm.render();
       
       finalDisplay.render();
      break;
      
      default:
        println("Warning: undefined game state for rendering.");
      break;
      
    }     
  }
  
  public void update(){
    switch(stateMachine.currentState){
      case GameState.PLAYING:
       snake.update();
     
       //We check if the worm its been eaten
       checkWormState();
     
       gameDisplay.update();
       
       checkEndGame();
      break;
      
      case GameState.END_GAME:
       
      break;
      
      default:
        println("Warning: undefined game state for game updating.");
      break;
      
    }   
    
     
  }
  
  public void checkWormState(){
    PVector headPosition = (new PVector()).set(snake.getHead().position);
    float displayHeadPositionX = headPosition.x;
    float displayHeadPositionY = headPosition.y;
    if(headPosition.x < 0) displayHeadPositionX = (displayHeadPositionX % GameBoard.GAME_WIDTH)+GameBoard.GAME_WIDTH;
    if(headPosition.y < 0) displayHeadPositionY = (displayHeadPositionY % GameBoard.GAME_HEIGHT)+GameBoard.GAME_HEIGHT;
    
    headPosition.set(displayHeadPositionX%GameBoard.GAME_WIDTH,displayHeadPositionY%GameBoard.GAME_HEIGHT);
    if(headPosition.sub(currentWorm.position).mag() <= DEFAULT_WORM_EAT_OFFSET){
      
      //We add a body part to the snake
      snake.addBodyPart();
      
      //We change the position of the worm
      currentWorm.setRandomPosition((int)screenSize.x-Worm.WIDTH,(int)screenSize.y-Worm.HEIGHT);
    }
  }
  
  public int getEatenWorms(){
    return snake.body.length-1;
  }
  
  private void checkEndGame(){
    //We check id the game is ended
    if(gameDisplay.timer <= 0) stateMachine.currentState = GameState.END_GAME;
  }
  
  public void keyPressed(){
    if(stateMachine.currentState == GameState.END_GAME){
      println("Some Key was pressed. Restarting game.");
      initGame();
    }
  }
  
  private void initGame(){
      //INIT the snake in the middle of the screen
      PVector initSnakePosition = PVector.div(screenSize,2);
      snake = new Snake(DEFAULT_LENGTH, initSnakePosition);
      
      gameDisplay = new GameDisplay(this);
      
      finalDisplay = new FinalDisplay(this);
      
      currentWorm = new Worm(new PVector());
      currentWorm.setRandomPosition((int)screenSize.x,(int)screenSize.y);
      
      stateMachine = new GameState();
      stateMachine.currentState = GameState.PLAYING;
  }
  
  private void drawBackground(){
    image(gameBackground,0,0,screenSize.x,screenSize.y);
  }
}
