class Widget {
float x, y, width, height;
String label; 
int event;
color widgetColor, labelColor;
PFont widgetFont;
Widget()
{
}
Widget(float x,float y, int width, int height, String label,color widgetColor, PFont widgetFont, int event){
this.x=x; 
this.y=y; 
this.width = width; 
this.height= height;
this.label=label;
this.event=event;
this.widgetColor=widgetColor;
this.widgetFont=widgetFont;
labelColor= color(0);
}
void draw()
{
fill(widgetColor);
rect(x,y,width,height);
fill(labelColor);
text(label, x+10, y+height-10);
}
int getEvent(int mX, int mY){
if(mX>x && mX < x+width && mY >y && mY <y+height){
return event;
}
return EVENT_NULL;
}
}

class CheckBox extends Widget{
  boolean eventBool;
  color selectedColor;

  CheckBox(float x,float y, int width, int height, color widgetColor, color selectedColor, boolean eventBool){
    //super(x, y, width, height, label, widgetColor, widgetFont, event);
    super();
    this.x=x; this.y=y; this.width = width; this.height= height;
    this.widgetColor=widgetColor;
    this.selectedColor = selectedColor;
    this.eventBool = eventBool;
   int type = 1;
  }

  int getEvent(int mX, int mY){
     if(mX>x && mX < x+width && mY >y && mY <y+height){
        return 3;
     }
     return 0;
  }

  void draw(){
    stroke(255, 255, 255);
    strokeWeight(10);
    if(eventBool == false){
      fill(widgetColor);
      rect(x,y,width,height);
    }
    else{
      fill(selectedColor);
      rect(x,y,width,height);
    }
  }
}

class RadioButton extends Widget{
  color backgroundColor;
  String[] choices;

  CheckBox[] circleButtons;

  RadioButton(float x,float y, color backgroundColor, String[] choices){
    super();
    this.x=x; this.y=y; height = choices.length*20;
    this.backgroundColor=backgroundColor;
    this.choices = choices;

    circleButtons = new CheckBox[choices.length];
    boolean start = true;
    float tempY = y + 10;
    for(int i=0;i < circleButtons.length; i++){
      circleButtons[i] = new CheckBox(x, tempY, 30, 30, color(255, 255, 255), color(20, 20, 20), start);
      start = false;
      tempY += 40;
    }
  }

  int getEvent(int mX, int mY){
    for(int i = 0; i < circleButtons.length; i++){
       if(mX>circleButtons[i].x && mX < circleButtons[i].x+30 && mY > circleButtons[i].y && mY < circleButtons[i].y+30){
         int temp = 3+i;
         return temp;
       }
     }
     return 0;
  }

  void draw(){ //<>//
    fill(backgroundColor); //<>//
    noStroke();
    //rect(x, y, width, height);
    float tempY = y + 7;
    for(int i=0;i < circleButtons.length; i++){
      circleButtons[i].draw();
      textAlign(CORNER, TOP);
      text(choices[i], x+40, tempY);
      tempY += 40;
    }
  }
}
