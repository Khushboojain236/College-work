class Ball{
 float x;
 float y;
 float rateX;
 float rateY;
 color ballColor= color(10,200,20);
 float time;
 
 Ball()
 {
   x= random(SCREENX/4,SCREENX/2);
   y= random(SCREENY/4,SCREENY/2);
   rateX=random(1,3);
   rateY=random(1,3);
    time = millis();
 }
 
 void move()
 {
   x=x+rateX;
   y=y+rateY;
   
 if(millis()> time + 300)
 {
      rateX *= 1.02;
      rateY *= 1.02;
      time = millis();
    }
}
 void draw()
 {
   fill(ballColor);
   ellipse( int(x),int(y),RAD,RAD);
 }
 
 // collision with  human player
void collide(Player tp)
{
if(y+RAD>= tp.yPosition && y-RAD<=tp.yPosition+BATHEIGHT &&
       x>= tp.xPosition && x<= tp.xPosition+BATWIDTH)
       if(rateY>0)
{
println("collided!");
rateY=-rateY;
rateX += 0.2*tp.velocity;
}

// collision with walls

if(x-RAD<=0) 
{
rateX= -rateX;
}
else if(x+RAD>=SCREENX)
{
rateX= -rateX;
}
}
//collision with computer Player
void collideComp(Player cp)
 {
  if (y-RAD <= cp.yPosition+BATHEIGHT && y-RAD>=cp.yPosition
        && x >= cp.xPosition && x<= cp.xPosition+BATWIDTH)
       if(rateY<0)
        {
       println("collided!");
       rateY=-rateY;
       rateY += 0.3*cp.vel;
    }
}
}
