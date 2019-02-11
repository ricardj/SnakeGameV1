class Worm{
 
  public static final int WIDTH = 60;
  public static final int HEIGHT = 60;
  
 public PVector position; 
 
 private PImage wormImage;
 
 Worm(PVector position){
   this.position = position;
   wormImage = loadImage("enemy.png");
 }
 
 public void render(){
   image(wormImage,position.x-WIDTH/2,position.y-HEIGHT/2,WIDTH,HEIGHT);
 }
 
 public void setRandomPosition(int widthLimit,int heightLimit ){
    position.set(random(widthLimit),random(heightLimit));
 }
 
}
