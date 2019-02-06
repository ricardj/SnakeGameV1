class SnakePortion extends Mover{
  
  int portionRadius = 55;
  
  SnakePortion(PVector position, PVector speed, PVector acceleration){
    super(position, speed, acceleration);
  }
  
  public void draw(){
    ellipse(position.x, position.y, portionRadius, portionRadius);
  }
}
