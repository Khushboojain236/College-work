 class Screen
 {
   ArrayList<Widget> widgetList;
   color screenColor;
   
   Screen (color screenColor)
   {
     this.screenColor=screenColor;
     widgetList=new ArrayList<Widget>();
   }
   
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
   
 void draw()
   {
    background(screenColor);
    for(int i = 0; i<widgetList.size(); i++)
     {
      Widget aWidget = (Widget)widgetList.get(i);
      if(mouseX>aWidget.x && mouseX<aWidget.x+aWidget.width && mouseY>aWidget.y && mouseY<aWidget.y + aWidget.height)
      {
      borderColor = color(255, 255, 255);
      }
      else
      {
      borderColor = color(0, 0, 0);
      }
     stroke(borderColor);
     aWidget.draw();
   }
 }
 
 void addWidget(Widget widget)
 {
   widgetList.add(widget);
 }
 }
 
