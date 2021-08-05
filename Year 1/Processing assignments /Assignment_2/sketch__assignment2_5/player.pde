class Player{
  int xPosition;
  int yPosition;
  float velocity;
  color batColor= color(100,200,190);
  int prevPositionX;
  float vel=2;
  
 Player(int screen_y)
 {
  xPosition=SCREENX/2;
  yPosition=screen_y;

 }
 void move(int x ){
  if(x>SCREENX-BATWIDTH) 
  {
  xPosition = SCREENX-BATWIDTH;
  }
  else
  {
   xPosition=x;
  }
   humanPlayer.velocity=humanPlayer.xPosition - humanPlayer.prevPositionX;
   humanPlayer.prevPositionX=humanPlayer.xPosition;
 }
void draw()
{
fill(batColor);
rect(xPosition, yPosition, BATWIDTH, BATHEIGHT);
}

 void computerMove()
 {  
   
 if(computerPlayer.xPosition+(BATWIDTH/2)<theBall.x+BATWIDTH) 
 {
   computerPlayer.xPosition+=vel;
 }
 if(computerPlayer.xPosition+(BATWIDTH/2)> theBall.x-BATWIDTH)
 {
   computerPlayer.xPosition-=vel;
 }
 if(millis() >theBall.time + 100)
 {
    if(vel <= theBall.rateX + 1.2) 
    {
    vel *= 1.597;
    theBall.time = millis();
    }
}
}
}
