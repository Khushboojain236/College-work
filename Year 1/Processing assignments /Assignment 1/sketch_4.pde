int x1= 200;
int x2= 400;
int  w =100;

void setup()
{
  smooth();
  size(600,600);
  background(#FFFFFF);
  noStroke(); 
}

void draw()
{
  background(#FFFFFF);
  fill(255,200,50);
  rect(x1,200,w,100);
  x1+=1;
   
  if(x1 ==600)
  {
    x1=0;
  }
  if ((x1+w)>600)
  {
    int w1=(x1+w)-600;
    rect(0, 200,w1,100);
  }

  fill(0,255,200);
  rect(x2,400,w,100);
  x2-=1;
  if(x2==0-w)
  {
    x2= 600-w;
  }
 
  if(x2<0)      /*will be negative so when subtracted from console size will give 
                  beginning  x coordinate for the wrapped up */
  {
    rect(x2+600,400,w,100);
  }
   
}
