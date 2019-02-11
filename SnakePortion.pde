class SnakePortion extends Mover{
  
  int portionRadius = 55;
  
  SnakePortion(PVector position, PVector speed, PVector acceleration){
    super(position, speed, acceleration);
  }
  
  public void render(){
    float renderingPositionX = position.x;
    float renderingPositionY = position.y;
    if(position.x < 0) renderingPositionX = (renderingPositionX % GameBoard.GAME_WIDTH)+GameBoard.GAME_WIDTH;
    if(position.y < 0) renderingPositionY = (renderingPositionY % GameBoard.GAME_HEIGHT)+GameBoard.GAME_HEIGHT;
    ellipse(renderingPositionX % GameBoard.GAME_WIDTH, (renderingPositionY % GameBoard.GAME_HEIGHT), portionRadius, portionRadius);
  }
  
}
