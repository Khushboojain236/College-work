Player humanPlayer;
Ball theBall;
Player computerPlayer ;  
int humanScore=0;
int computerScore=0;


void settings()
{
smooth();
size(SCREENX, SCREENY);
}
void setup()
{
textSize(30);
textAlign(CENTER);
humanPlayer = new Player(SCREENY-BATHEIGHT-MARGIN);
computerPlayer= new Player (MARGIN);
theBall = new Ball();
ellipseMode(RADIUS); 
}

void draw() 
{
background(#FFFFFF);
noStroke();
humanPlayer.move(mouseX);
computerPlayer.computerMove();
theBall.move();
theBall.collide(humanPlayer);
theBall.collideComp(computerPlayer);
humanPlayer.draw();
computerPlayer.draw();
theBall.draw();
ballCheck();
gameOver();
scores();
println(computerPlayer.vel);
println(theBall.rateX);
}

void mousePressed()
{
  loop(); // as a button is pressed we want to run the under code
}

void reset()
{
  background(#FFFFFF);
  humanPlayer = new Player(SCREENY-MARGIN-BATHEIGHT);
  computerPlayer = new Player(MARGIN);
  theBall = new Ball();
  humanPlayer.draw();
  computerPlayer.draw();
  theBall.draw();
  noLoop(); //so it doesn't start the reset loop again and again
}

void scores()
{
  fill(0);
  text(humanScore, 500,500);
  text(computerScore,100,100);
}
 void ballCheck()
 {
  if(theBall.y<RAD) // as the ball will move out of the ceiling 
  {
    humanScore++;
     reset();
   }
    
    if(theBall.y > SCREENY - RAD) // as the ball will move out of the floor 
    {
     computerScore++;
     reset();
    }
 } 
 void gameOver()
 {
   if(humanScore==MAXLIVES)
   {
     theBall.rateX=0;
     theBall.rateY=0;
     text("PLAYER WINS!",SCREENX/2,SCREENY/2);
   }
   if(computerScore==MAXLIVES)
   {
     theBall.rateX=0;
     theBall.rateY=0;
     text("COMPUTER WINS!",SCREENX/2,SCREENY/2);
   }
  
 }
