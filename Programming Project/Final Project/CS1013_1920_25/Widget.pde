// creates widgets its the super class ; made by Khushboo Jain
class Widget {
int x, y, width, height;
String label; 
int event;
color widgetColor, labelColor;
PFont widgetFont;
// default constructor
Widget()
{
}
//constructor
Widget(int x,int y, int width, int height, String label,color widgetColor, int event){
this.x=x; 
this.y=y; 
this.width = width; 
this.height= height;
this.label=label;
this.event=event;
this.widgetColor=widgetColor;
labelColor= color(0);
}

void draw()
{
stroke(0,0,0);
fill(widgetColor);
rect(x,y,width,height);
fill(labelColor);
text(label, x+10, y+height-10);
}
// to get the event as per users click to check whether clickedor not
int getEvent(int mX, int mY){
if(mX>x && mX < x+width && mY >y && mY <y+height)
{
return event;
}
return EVENT_NULL;
}

// gets the label of the widget
String getLabel()
{
  return label;
}
// sets the widget label 
void setLabel()
{
  label="Please enter a valid query ";
}
}
