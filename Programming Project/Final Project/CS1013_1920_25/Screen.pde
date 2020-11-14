//to display various screens;made by Khushboo Jain
class Screen
 {
   PImage bulb;
   ArrayList<Widget> widgetList;
   ArrayList<ControlP5> sliderList;
   color screenColor;
   int screenNumber;
   // constructor
   Screen (color screenColor, int screenNumber)
   {
     this.screenColor=screenColor;
     this.screenNumber=screenNumber;
     widgetList=new ArrayList<Widget>();
     sliderList =new ArrayList<ControlP5>();
     bulb=loadImage("bulb.png");
   }
   //returns the event if the widget has been pressed present on the screen
  int getEvent()
   {
     for(int i=0; i<widgetList.size();i++)
     {
       Widget aWidget = (Widget)widgetList.get(i);
       int event=aWidget.getEvent(mouseX,mouseY);
       if (event!=0)
       return event;
      }
     return 0;
   }
   void setup()
   {
     if (screenNumber==1)
     {
       background(screenColor);
     }
     if (screenNumber==3)
     {
       background(screenColor);
     }
     if (screenNumber==4)
     {
       background(screenColor);
     }
     
   }
 void draw()
  {
    // displays the widgets according to the screen
    for(int i = 0; i<widgetList.size(); i++)
     {
      Widget aWidget = (Widget)widgetList.get(i);
      aWidget.draw();
     }
     
     //B.Bredican - to draw slider to screen
     for(int i =0; i<sliderList.size(); i++)
     {
       if(sliderList.get(i)!=null)
       {
       ControlP5 aSlider =(ControlP5)sliderList.get(i);
       aSlider.draw();
       }
     }
     
     
    if (screenNumber==1)
    {
      // appearance of screen 1
     fill(#FFFFFF);
     textFont(myFont);
     text("Programmimg Project",80,730);
     text("Group 25",80,748);
     for(int pos=10;pos<=800;pos+=20)
     {
     strokeWeight(1);
     stroke(#FFFFFF);
     line(pos,20,pos,700);
     }
     strokeWeight(1);
     stroke(#00D1D2);
     line(590,20,590,700);
     float x=0;
     float a=0;
     colorMode(HSB,100);
     while(x<width)
     {
       stroke(random(100),100,100);
       float y= map(sin(a)*sin(a*2)*sin(a*1.7),-1,1,200,600);
       strokeWeight(5);
       point(x,y);
       x++;
       a=a+0.03;
     } 
     noStroke();
     fill(#00D1D2);
     ellipse(590,250,20,20);
    }
    if(screenNumber==2)
    {
      // appearance of screen 2
    image(bulb,30,30,100,100);
    
    frameRate(20);
    float x= random(width-400);
    float y=random(height);
    float w=random(100);
    float h=random(100);
    fill(#FFFFFF);
    strokeWeight(1);
    stroke(#50C878);
    rect(x,y,w,h);
    }
 }
 // to add widgets to a screen adds them in the ArrayList
 void addWidget(Widget widget)
 {
   widgetList.add(widget);
 }
 
 //B.Brdeican- to add slider to screen
 void addSliderToScreen(ControlP5 slider)
 {
   sliderList.add(slider);
 }
}
