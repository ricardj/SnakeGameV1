class Snake{
 public final PVector DEFAULT_SPEED = new PVector(2,2);
 public final PVector DEFAULT_ACCELERATION = new PVector(0,0);
 public final int DEFAULT_BODY_PADDING = 30;         //Space between Body parts
 public SnakePortion[] body;                         //Array of body parts
 
 
 Snake(int length, PVector position){
   createHead(position);
   createBody(length);
 }
 private void createHead(PVector position){
   body = new SnakePortion[1];
   SnakePortion head = new SnakePortion(position, DEFAULT_SPEED, DEFAULT_ACCELERATION);
   body[0] = head;
 }
 private void createBody(int length){
   for(int i = 0; i < length; i++) addBodyPart();
 }
 
 public void draw(){
    //Draw all the body parts
    
 }
 
 public void addBodyPart(){
   int lastPartIndex = body.length-1;
   PVector
   
   
   SnakePortion newBodyPart = new SnakePortion();
   body = append(body,newBodyPart);
 }
 
}
