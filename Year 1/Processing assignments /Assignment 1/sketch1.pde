
int x1 = 150; //coordinate x for top square
int x2 = 200; //coordinate x for middle square
int y1 = 250 ; //coordinate y for bottom square
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
rect(x1,150,100,100);  //top square
x1-=1;                 //decrease by one so moves to the left
fill(0,200,200);
rect(250,y1,100,100);  //lower square
y1+=1;                 // increase by one so moves down
fill(0,200,50);
rect(x2,200,100,100);  //middle square
x2+=1;                 //increase by one so moves to the right

}



 
