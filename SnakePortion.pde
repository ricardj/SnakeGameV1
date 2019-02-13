class SnakePortion extends Mover{
  
  int portionRadius = 50;
  
  PImage snakePortionImage;
  
  SnakePortion(PVector position, PVector speed, PVector acceleration){
    super(position, speed, acceleration);
    snakePortionImage = loadImage("snakePortion.png");  //We load the image which will be used to show every snake portion on screen.
  }
  
  //Function which shows on screen a portion from the snake
  public void render(){
    float renderingPositionX = position.x;
    float renderingPositionY = position.y;
    
    //If the position of the object goes offscreen through the left side or going up, we use this operation so it appears on the other side normally.
    if(position.x < 0) renderingPositionX = (renderingPositionX % GameBoard.GAME_WIDTH)+GameBoard.GAME_WIDTH;
    if(position.y < 0) renderingPositionY = (renderingPositionY % GameBoard.GAME_HEIGHT)+GameBoard.GAME_HEIGHT;
    
    image(snakePortionImage,
          renderingPositionX % (GameBoard.GAME_WIDTH)-portionRadius/2, 
          renderingPositionY % (GameBoard.GAME_HEIGHT)-portionRadius/2, 
          portionRadius, 
          portionRadius);
  }
  
}
