
class Alien {
 /* declare variables for alien position, direction of movement and appearance */
int xpos;
int ypos;
int dir;
PImage alienImage;
PImage appearance;
int downy=0;
 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
 Alien(int xpos, int ypos, PImage alienImage){
  /* set up the new alien object */ 
  this.xpos=xpos;
  this.ypos=ypos;
  this.alienImage=alienImage;
  this.appearance=alienImage;
 }
  
 void move()
 {
   if(downy==alienImage.height)
   {
    dir= (xpos< width/2)?A_FORWARD:A_BACKWARD;
    downy=0;
   }
   else if ( xpos + alienImage.width >= screenx)
   {
     dir=A_DOWN;
   }
   else if (xpos<=0)
   {
     dir= A_DOWN;
   }
   
   if(dir==A_FORWARD)
   {
     xpos++;
   }
   else if(dir==A_BACKWARD)
   {
     xpos--;
   }
   else if(dir==A_DOWN)
   {
     ypos++;
     downy++;
   }
   
  /* Move the alien according to the instructions in the exercise */
  }
  void draw()
  {
    /* Draw the alien using the image() method demonstrated in class */
     image(appearance,xpos,ypos);
  }
  void explode()
  {
  float change = random(0,10000);
 if(change<10)
  {
    appearance=explodeImage;
  }
  
}
}
