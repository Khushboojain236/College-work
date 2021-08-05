int x=50;


void setup(){
size(500,500);
}

void draw(){
  background(255);

    line (50,440,400,440); // Ligne du slider
  
  
  rect(x,425,10,30);
  println(x);
     //image(img,0,0);

  
}
void mouseDragged(){

    //constrain(mouseX,50,440);
      x=mouseX;
      if (x<50){
         x=50;  
      }
      else if (x>400){
        x=400;
      }
    }
