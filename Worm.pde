class Worm{
 
  public static final int WIDTH = 60;  
  public static final int HEIGHT = 60;
  
 public PVector position; 
 
 private PImage wormImage;
 
 Worm(PVector position){  //Unique constructor which starts with a position
   this.position = position;
   wormImage = loadImage("enemy.png");  //We load the image that will be displayed later in the game
 }
 
 //Function that displays the worm on screen
 public void render(){
   image(wormImage,position.x-WIDTH/2,position.y-HEIGHT/2,WIDTH,HEIGHT);
 }
 
 //Function that makes the worm respawn in a random position within the limits of the screen
 public void setRandomPosition(int widthLimit,int heightLimit ){
    position.set(random(widthLimit),random(heightLimit)); 
 }
 
}
