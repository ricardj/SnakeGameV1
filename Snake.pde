class Snake{
 public static final int DEFAULT_SPEED = 15;
 public static final int DEFAULT_BODY_PADDING = 40;         //Space between Body parts
 public SnakePortion[] body;                                //Array of body parts
 private PVector oldMousePosition;
 
 
 Snake(int length, PVector position){
   createHead(position);
   createBody(length);
   
   oldMousePosition = new PVector(mouseX, mouseY);
 }
 
 //Function which creates the head of the snake at the given position
 private void createHead(PVector position){
   body = new SnakePortion[1];
   //We create the new snake portion with the given position abd with no inicial velocity or acceleration.
   SnakePortion head = new SnakePortion(position, new PVector(0,0), new PVector(0,0));  
   body[0] = head;
 }
 
 //Function wich creates a full snake body (without the head included) with the given length.
 private void createBody(int length){
   for(int i = 1; i < length; i++) addBodyPart();
 }
 
 //Function which appends a new body part to the already existing body or head
 public void addBodyPart(){
   int bodyLength = body.length;
   PVector startPosition = new PVector().set(body[bodyLength-1].position);
   SnakePortion newPart = new SnakePortion(startPosition, new PVector(0,0), new PVector(0,0));  //The new part is created in the same place which the previos part was located.
   body = (SnakePortion[])append(body,newPart);
 }
 
 //Function which return the lenght of the snake.
 public int snakeSize(){
   return body.length-1;
 }
 
 //
 public SnakePortion getHead(){
   return body[0];
 }
 
 public void render(){
    fill(200);
    //Draw all the body parts
    for(int i = 0; i < body.length; i++) body[i].render();
 }
 
 public void update(){
   //Update head position towards the mouse
   //We get the mouse position
   PVector mousePosition = new PVector(mouseX,mouseY);
   
   if(mousePosition.x != oldMousePosition.x && mousePosition.y != oldMousePosition.y){
     //Mouse position has changed so
     oldMousePosition = mousePosition;
     PVector displayHeadPosition = new PVector().set(body[0].position);
     displayHeadPosition.set(displayHeadPosition.x%GameBoard.GAME_WIDTH, displayHeadPosition.y%GameBoard.GAME_HEIGHT);
     
     if(body[0].position.x < 0 ) displayHeadPosition.x += GameBoard.GAME_WIDTH;
     if(body[0].position.y < 0 ) displayHeadPosition.y += GameBoard.GAME_HEIGHT;
     
     PVector mouseHeadDistance = PVector.sub(mousePosition,displayHeadPosition);
     body[0].speed = mouseHeadDistance.normalize().mult(DEFAULT_SPEED);
   }
   body[0].move();
   
   
   //Update Body parts towards the head
   for(int i = 1; i < body.length; i++){
     //We calculate diference between body parts
     PVector bodyPortionDiference = PVector.sub(body[i-1].position,body[i].position);
     if(bodyPortionDiference.mag() > DEFAULT_BODY_PADDING){
       body[i].speed = bodyPortionDiference.normalize().mult(DEFAULT_SPEED);
       body[i].move();
     }
   }
   
 }
 
}
