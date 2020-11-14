int x=150; // x coordinate of the rectangle
void setup()
{
size(500,500);
background(#FFFFFF);
smooth();
noStroke();
}
void draw()
{
  background(#FFFFFF);
  fill(255,200,50);
  rect(x,150,100,100);
  x+=1;
  if(x>499) //reaches end of console 
  {
    x=0;    // start again from the beginning of console  
  }
}
