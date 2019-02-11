class Mover{
  
  public PVector direction;
  public PVector position;
  public PVector speed;
  public PVector acceleration;
  
  Mover(PVector position, PVector speed, PVector acceleration){
    this.position = position;
    this.speed = speed;
    this.acceleration = acceleration;
    this.direction = new PVector(-1,0);
    
    updateDirection();
  }
  
  public void move(){
   
   updateDirection();
   
   position.add(speed);
   speed.add(acceleration);
  }
  
   
  public void updateDirection(){
    if(speed.mag()!=0) direction.set(speed).normalize();
  }
  
}
