int x = 150;
int w = 100;

void setup()
{
  smooth();
  size(500, 500);
  background(#FFFFFF);
  noStroke(); 
}

void draw()
{
  background(#FFFFFF);
  fill(255,200,50);
  rect(x,150, w,100);
   x+=1;
  
  if(x==499) 
  {
    x=0;
  }
  if((x+w)>500)
  {
    int w1=(x+w)-500;  // width of wrapped up part
    rect(0, 150, w1, 100);
  }
}
/* in here we check what the coordinate of x is if it reaches the size of console
we make the coordinate x=0. Parallel to make sure the other end of the square has reached 
the end we can add the position x coordinate with width to see if it exceeds the console 
size and subtract the same from the console size to get the width of the wrapped beginning 
square and it will start with its x coordinate being 0  */ 
