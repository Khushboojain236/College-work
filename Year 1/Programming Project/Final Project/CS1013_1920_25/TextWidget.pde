// sub class of the Widget class; made by Khushboo Jain
class TextWidget extends Widget
{
int maxlen;
//constructor
TextWidget(int x, int y, int width, int height,String label, color widgetColor,int event,int maxlen)
{
  this.x=x;
  this.y=y; 
  this.width = width;
  this.height= height;
  this.label=label;
  this.event=event;
  this.widgetColor=widgetColor; 
  labelColor=color(0); 
  this.maxlen=maxlen;
}
// to see what needs to be displayed in label change label according to key pressed
void append(char s)
{
 if(s==BACKSPACE)
 {
 if(!label.equals(""))
 label=label.substring(0,label.length()-1);
 }
 else if (label.length() <maxlen)
 label=label+str(s);
}
}
