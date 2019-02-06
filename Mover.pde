class Mover{
   
  public PVector position;
  public PVector speed;
  public PVector acceleration;
  
  Mover(PVector position, PVector speed, PVector acceleration){
    this.position = position;
    this.speed = speed;
    this.acceleration = acceleration;
  }
  
  public void move(){
   position.add(speed);
   speed.add(acceleration);
  }
  
}
