
PFont stdFont;
final int EVENT_BUTTON1=5;
final int EVENT_BUTTON2=4;
final int EVENT_FORWARD=1;
final int EVENT_BACKWARD=2;
final int EVENT_NULL=0;
final int TOGGLE=3;
Screen screenOne;
Screen screenTwo;
int screen=1;
CheckBox checkBox;
RadioButton radioButton;

color squareColor= (#FFFFFF);
color borderColor;
void setup()
{
borderColor = color(0,0,0);
Widget widget1, widget2, forwardButton ,backwardButton;
size(600, 600);

screenOne = new Screen(color(#FFFFFF));
screenTwo = new Screen(color(200));
stdFont=loadFont("Klee-Medium-21.vlw"); 
textFont(stdFont);
widget1=new Widget(200, 200, 100, 40,"Button1",color(255,0,0),stdFont,EVENT_BUTTON1);
widget2=new Widget(200 ,200, 100, 40,"Button2",color(0,0,255),stdFont,EVENT_BUTTON2);
forwardButton=new Widget(200, 500, 100, 40,"Forward",color(0,255,0),stdFont, EVENT_FORWARD);
backwardButton=new Widget(200, 500, 100, 40,"Back",color(0,255,255),stdFont, EVENT_BACKWARD);
checkBox = new CheckBox(10, 10, 50, 50, color(200), color(10), false);
    String[] array = {""};
    radioButton = new RadioButton(20,20, color (200,200,150), array);

screenOne.addWidget(forwardButton);
screenOne.addWidget(widget1);
 screenOne.addWidget(checkBox);


screenTwo.addWidget(backwardButton);
screenTwo.addWidget(widget2);
 screenTwo.addWidget(radioButton);
}
void draw()
{
 if(screen==1)
 {
  screenOne.draw();
 }
 else
 {
  screenTwo.draw();
 }
}

void mousePressed()
{
  if (screen==1)
  {
   int event = screenOne.getEvent();
   switch(event) 
   {
    case EVENT_BUTTON1:
    println("button 1! Press forward to go ahead !");
    break;
    case EVENT_FORWARD:
     screen=2;
     break;
     case TOGGLE:
     checkBox.eventBool = !checkBox.eventBool;
   }
  }
  
  else
  {
   int event = screenTwo.getEvent();
          for(int i = 0; i < radioButton.choices.length; i++){
            if(event-3 == i){
              radioButton.circleButtons[i].eventBool = true;
            }
            else if(event - 3 >= 0){
              radioButton.circleButtons[i].eventBool = false;
            }
  }
}
}
