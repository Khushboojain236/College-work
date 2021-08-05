int x1=200;
int y1=100;
int x2=400;
int h=100;
int w=100;

float angle =0;  // velocity angle


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
  fill((sin(angle)*255)%255,200,100);
  float val=sin(angle) *100;  /*val is multiplied by 100 as its our amplitude(height) 
                                we use sine value to make it go up n down (-1 n 1)*/
  rect(x1,y1+val,w,h);   /* we add val with the y coordinate */
  x1+=1;
  
  
   
  if(x1 == 600)
  {
    x1=0;
  }
  if ((x1+w)>600)
  {
    int w1=(x1+w)-600;
    rect(0,100+val,w1,h);
  }
  

  fill((sin(angle)*255)%255,100,100);
  //to change colors randomly  
  rect(x2,300+val,w,100); //here y coordinate is 300
  
  
  x2-=1;  // to move to the left
 
  if(x2==0-w)
  {
    x2=600-w;
  }
  if(x2<0)
  {
    rect(x2+600,300+val,w,h);
  }
    angle+= 0.05;
    
    
}
