//radio buttons is a sub class of the widget class which overrides the draw and get event method, made by Khushboo Jain
class RadioButtons extends Widget{
  color normalColor;
  color selectedColor;
  int radius;
  //constructor
  RadioButtons(int x, int y, int width,int height , color normalColor, color selectedColor,String label, int event)
  {
    this.x=x;
    this.y=y;
    this.width=width;
    this.height=height;
    this.normalColor=normalColor;
    this.selectedColor=selectedColor;
    this.label=label;
    this.event=event;
  }
  @Override
  void draw()
  {
    stroke(0,0,0);
    fill(normalColor);
    rect(x,y,width,height);
    fill(0);
    text(label,x+30,y+15);
  }
  @Override
  //checks if the person has clicked inside the box
  int getEvent(int mX, int mY)
  {
  if(mX>x && mX<x+width && mY>y && mY<y+height)
  {
  fill(selectedColor);
  rect(mX-5,mY-5,10,10);
  return event;
  }
  return EVENT_NULL;
 }
}
