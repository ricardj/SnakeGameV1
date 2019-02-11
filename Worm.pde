class Worm{
 
  public static final int WIDTH = 30;
  public static final int HEIGHT = 30;
  
 public PVector position; 
 
 Worm(PVector position){
   this.position = position;
 }
 
 public void render(){
   rect(position.x-WIDTH/2,position.y-HEIGHT/2,WIDTH,HEIGHT);
 }
 
 public void setRandomPosition(int widthLimit,int heightLimit ){
    position.set(random(widthLimit),random(heightLimit));
 }
 
}
