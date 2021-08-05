ArrayList widgetList;
PFont stdFont;
final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_NULL=0;
final int EVENT_BUTTON4=4;
final int EVENT_BUTTON5=5;

boolean check=false;
color squareColor= (#FFFFFF);
void setup()
{
Widget widget1, widget2, widget3,widget4,widget5;
size(600, 600);
stdFont=loadFont("Klee-Medium-21.vlw"); 
textFont(stdFont);
widget1=new Widget(50, 100, 100, 40,"red",color(255,0,0), stdFont,EVENT_BUTTON1);
widget2=new Widget(250,100, 100, 40,"blue",color(0,0,255), stdFont,EVENT_BUTTON2);
widget3=new Widget(450, 100, 100, 40,"green",color(0,255,0),stdFont, EVENT_BUTTON3);
widget4=new Widget(300,200,50,50,color(255,255,255),EVENT_BUTTON4);
widget5=new Widget(300,200,50,50,color(255,255,255),EVENT_BUTTON5);
widgetList = new ArrayList();
widgetList.add(widget1);
widgetList.add(widget2);
widgetList.add(widget3);
widgetList.add(widget4);
widgetList.add(widget5);
}
void draw()
{
for(int i = 0; i<widgetList.size(); i++)
{
Widget aWidget = (Widget)widgetList.get(i);
aWidget.draw();
}

fill(squareColor);
noStroke();
rect(250,300,150,150);
}
void mousePressed()
{
int event;
for(int i = 0; i<widgetList.size(); i++)
{
Widget aWidget = (Widget) widgetList.get(i);
event = aWidget.getEvent(mouseX,mouseY);
switch(event) {
case EVENT_BUTTON1:
println("button 1!");
squareColor=color(255,0,0);
break;
case EVENT_BUTTON2:
println("button 2!");
squareColor=color(0,0,255);
break;
case EVENT_BUTTON3:
println("button 3!");
squareColor=color(0,255,0);
break;
}
}
}
