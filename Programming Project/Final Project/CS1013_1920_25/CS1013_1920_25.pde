//the main program which looks at the main functionality and the appearance of the console in response to the actions of the user  //<>//
import controlP5.*; //<>//

Table rawData;
ArrayList <stockData> data;
ArrayList myWidgets;
ArrayList uniqueTickers;
ArrayList radioSet1;
ArrayList radioSet2;
PFont myFont;
PImage bulb;
stockData[] dataPoints;
Screen screenOne;
Screen screenTwo;
Screen queryScreenOne;
Screen queryScreenTwo;
int screen=1;
public String label="";
public String uniqueTicker="";

//B.Bredican & K.Jain- declaring sliders
ControlP5 slider4;
ControlP5 slider5;
ControlP5 slider6;
ControlP5 slider1;
ControlP5 slider2;
ControlP5 slider3;
int sliders1=1;
int sliders2=1;
int sliders3=1980;
int sliders4=1;
int sliders5=1;
int sliders6=1980;

TextWidget focus;
Widget widget1;
Widget queryButton;
Widget returnHome;
Widget widgetReturn;
Widget widgetSearch;

void setup(){
  // basic setup of the program
  //K.Jain & B.Bredican- intializing sliders
  slider1 =new ControlP5(this);
  slider2 =new ControlP5(this);
  slider3 =new ControlP5(this);
  slider4 =new ControlP5(this);
  slider5 =new ControlP5(this);
  slider6 =new ControlP5(this);
  //console size -K.Jain
  size(800,800);
  myFont=loadFont("AppleMyungjo-19.vlw");
  //adding the screens-K.Jain & P.Kenny
  screenOne=new Screen(0,SCREEN_NUM_1);
  screenTwo=new Screen(#FFFFFF,SCREEN_NUM_2);
  queryScreenOne = new Screen(#02219e, QUERY1PRESSED);
  queryScreenTwo = new Screen(#ff0008, QUERY2PRESSED);
  //text widget has in focus or not ; default is null-K. Jain
  focus=null;
  TextWidget textedit=new TextWidget(300, 100, 300, 40,"Please enter a valid query", color(255), EVENT_TEXT, 10);
  //normal click on buttons- K. Jain
  widget1= new Widget(680,730,100,30,"Explore!",color(#FFFFFF),SCREEN1_BUTTON);
  widgetSearch= new Widget(620,100,100,40,"Search",color(150),SEARCH_BUTTON);
  widgetReturn=new Widget(680,730,100,30,"Back !",color(#FFFFFF),RETURN_TO_QUERIES);
  queryButton= new Widget(500,730, 100, 30, "Run", color(150), QUERY1PRESSED);
  returnHome= new Widget(680,730,100,30,"Home",color(150), RETURNPRESSED);
  //radio buttons for query 1-K.Jain
  RadioButtons radio_Query1_1= new RadioButtons(500,240,25,25,color(#FFFFFF),color(0),"One",QUERY1_R1);
  RadioButtons radio_Query1_2= new RadioButtons(500,270,25,25,color(#FFFFFF),color(0),"Two",QUERY1_R2);
  RadioButtons radio_Query1_3= new RadioButtons(500,300,25,25,color(#FFFFFF),color(0),"Three",QUERY1_R3);
  RadioButtons radio_Query1_4= new RadioButtons(500,330,25,25,color(#FFFFFF),color(0),"Four",QUERY1_R4);
  RadioButtons radio_Query1_5= new RadioButtons(500,360,25,25,color(#FFFFFF),color(0),"Five",QUERY1_R5);
  RadioButtons radio_Query1_6= new RadioButtons(500,390,25,25,color(#FFFFFF),color(0),"Six",QUERY1_R6);
  //creating arraylist of radio buttons for query 1-K.Jain
  radioSet1=new ArrayList();
  radioSet1.add(radio_Query1_1);
  radioSet1.add(radio_Query1_2);
  radioSet1.add(radio_Query1_3);
  radioSet1.add(radio_Query1_4);
  radioSet1.add(radio_Query1_5);
  radioSet1.add(radio_Query1_6);
  
  //radio buttons for query 2-K. Jain
  RadioButtons radio_Query2_1= new RadioButtons(500,240,25,25,color(#FFFFFF),color(0),"AAPL",QUERY2_R1);
  RadioButtons radio_Query2_2= new RadioButtons(500,270,25,25,color(#FFFFFF),color(0),"AFSI",QUERY2_R2);
  RadioButtons radio_Query2_3= new RadioButtons(500,300,25,25,color(#FFFFFF),color(0),"AHH",QUERY2_R3);
  RadioButtons radio_Query2_4= new RadioButtons(500,330,25,25,color(#FFFFFF),color(0),"AHL",QUERY2_R4);
  RadioButtons radio_Query2_5= new RadioButtons(500,360,25,25,color(#FFFFFF),color(0),"AMSWA",QUERY2_R5);
  RadioButtons radio_Query2_6= new RadioButtons(500,390,25,25,color(#FFFFFF),color(0),"APO",QUERY2_R6);
  RadioButtons radio_Query2_7= new RadioButtons(500,420,25,25,color(#FFFFFF),color(0),"BRFS",QUERY2_R7);
  RadioButtons radio_Query2_8= new RadioButtons(500,450,25,25,color(#FFFFFF),color(0),"CAAS",QUERY2_R8);
  RadioButtons radio_Query2_9= new RadioButtons(500,480,25,25,color(#FFFFFF),color(0),"CCNE",QUERY2_R9);
  RadioButtons radio_Query2_10= new RadioButtons(500,510,25,25,color(#FFFFFF),color(0),"CLWT",QUERY2_R10);
  RadioButtons radio_Query2_11= new RadioButtons(500,540,25,25,color(#FFFFFF),color(0),"CRCM",QUERY2_R11);
  RadioButtons radio_Query2_12= new RadioButtons(500,570,25,25,color(#FFFFFF),color(0),"DSKE",QUERY2_R12);
  RadioButtons radio_Query2_13= new RadioButtons(500,600,25,25,color(#FFFFFF),color(0),"EGHT",QUERY2_R13);
  RadioButtons radio_Query2_14= new RadioButtons(500,630,25,25,color(#FFFFFF),color(0),"FLWS",QUERY2_R14);
  RadioButtons radio_Query2_15= new RadioButtons(500,660,25,25,color(#FFFFFF),color(0),"GHDX",QUERY2_R15);
  RadioButtons radio_Query2_16= new RadioButtons(500,690,25,25,color(#FFFFFF),color(0),"GTN",QUERY2_R16);
  RadioButtons radio_Query2_17= new RadioButtons(610,240,25,25,color(#FFFFFF),color(0),"GTS",QUERY2_R17);
  RadioButtons radio_Query2_18= new RadioButtons(610,270,25,25,color(#FFFFFF),color(0),"GTT",QUERY2_R18);
  RadioButtons radio_Query2_19= new RadioButtons(610,300,25,25,color(#FFFFFF),color(0),"ISTR",QUERY2_R19);
  RadioButtons radio_Query2_20= new RadioButtons(610,330,25,25,color(#FFFFFF),color(0),"MHD",QUERY2_R20);
  RadioButtons radio_Query2_21= new RadioButtons(610,360,25,25,color(#FFFFFF),color(0),"MHF",QUERY2_R21);
  RadioButtons radio_Query2_22= new RadioButtons(610,390,25,25,color(#FFFFFF),color(0),"NSEC",QUERY2_R22);
  RadioButtons radio_Query2_23= new RadioButtons(610,420,25,25,color(#FFFFFF),color(0),"OXLC",QUERY2_R23);
  RadioButtons radio_Query2_24= new RadioButtons(610,450,25,25,color(#FFFFFF),color(0),"PEY",QUERY2_R24);
  RadioButtons radio_Query2_25= new RadioButtons(610,480,25,25,color(#FFFFFF),color(0),"PEZ",QUERY2_R25);
  RadioButtons radio_Query2_26= new RadioButtons(610,510,25,25,color(#FFFFFF),color(0),"RAVN",QUERY2_R26);
  RadioButtons radio_Query2_27= new RadioButtons(610,540,25,25,color(#FFFFFF),color(0),"RRC",QUERY2_R27);
  RadioButtons radio_Query2_28= new RadioButtons(610,570,25,25,color(#FFFFFF),color(0),"RRD",QUERY2_R28);
  RadioButtons radio_Query2_29= new RadioButtons(610,600,25,25,color(#FFFFFF),color(0),"SASR",QUERY2_R29);
  RadioButtons radio_Query2_30= new RadioButtons(610,630,25,25,color(#FFFFFF),color(0),"VIAV",QUERY2_R30);
 
  //creating arraylist of radio buttons for query 2
  radioSet2=new ArrayList();
  radioSet2.add(radio_Query2_1);
  radioSet2.add(radio_Query2_2);
  radioSet2.add(radio_Query2_3);
  radioSet2.add(radio_Query2_4);
  radioSet2.add(radio_Query2_5);
  radioSet2.add(radio_Query2_6);
  radioSet2.add(radio_Query2_7);
  radioSet2.add(radio_Query2_8);
  radioSet2.add(radio_Query2_9);
  radioSet2.add(radio_Query2_10);
  radioSet2.add(radio_Query2_11);
  radioSet2.add(radio_Query2_12);
  radioSet2.add(radio_Query2_13);
  radioSet2.add(radio_Query2_14);
  radioSet2.add(radio_Query2_15);
  radioSet2.add(radio_Query2_16);
  radioSet2.add(radio_Query2_17);
  radioSet2.add(radio_Query2_18);
  radioSet2.add(radio_Query2_19);
  radioSet2.add(radio_Query2_20);
  radioSet2.add(radio_Query2_21);
  radioSet2.add(radio_Query2_22);
  radioSet2.add(radio_Query2_23);
  radioSet2.add(radio_Query2_24);
  radioSet2.add(radio_Query2_25);
  radioSet2.add(radio_Query2_26);
  radioSet2.add(radio_Query2_27);
  radioSet2.add(radio_Query2_28);
  radioSet2.add(radio_Query2_29);
  radioSet2.add(radio_Query2_30);
  
  
  
  rawData =loadTable("daily_prices100k.csv", "header");
  println(rawData.getRowCount() + "total rows in table");
  data = new ArrayList <stockData>();
  readInData(data, rawData);
 //text widget arrayList-K.Jain
  myWidgets = new ArrayList();
  myWidgets.add(textedit);
  // adding widgets to required screens-K.Jain
  screenOne.addWidget(widget1);
  queryScreenOne.addWidget(widgetReturn);
  screenTwo.addWidget(queryButton);
  screenTwo.addWidget(widgetSearch);
  screenTwo.addWidget(returnHome);
  queryScreenOne.addWidget(widgetReturn);
  queryScreenTwo.addWidget(widgetReturn);  
}
//<>// //<>//
// Function to read the data set into the stockData Class
// P.kenny
ArrayList readInData(ArrayList data, Table rawData){
     for (TableRow row :rawData.rows())
     {
      String ticker = row.getString(0);
      float open = row.getFloat(1);
      float close = row.getFloat(2);
      float adj_close = row.getFloat(3);
      float low = row.getFloat(4);
      float high = row.getFloat(5);
      float volume = row.getFloat(6);
      String date = row.getString(7);
      data.add(new stockData(ticker, open, close, adj_close,low,high,volume,date));
     }
    return data;
}
void draw(){
 Graph graph = new Graph(data);
 // draws the required screen-K.Jain and P.Kenny
switch (screen){
 case 1:
 screenOne.setup();
 screenOne.draw();
 break;
 case 2: 
 screenTwo.draw();
 fill(#50C878);
 triangle(110,110,130,200,200,200);
 rect(130,200,350,200);
 fill(0);
 textSize(20);
 text("Enter the following for queries:",133,230);
 text("one:Compare the number of stocks",133,250);
 text("moved between number of companies",133,270);
 text("and date choosen by you",133,290);
 text("two:Observing change in stocks of",133,310);
 text("a company choosen by you ",133,330);
 text("three:Finding biggest change in ",133,350);
 text("stocks between two dates choosen",133,370);
 text("by you",133,390);
 for(int i = 0; i < myWidgets.size(); i++)
 {
 ((Widget)myWidgets.get(i)).draw();
 }
 break;
 case 3:
 queryScreenOne.setup();
 queryScreenOne.draw();
 String text = ((Widget)myWidgets.get(0)).getLabel();
 
 String slider1 = str(sliders1);
 if(str(sliders1).length() ==1)
   slider1 = "0" + str(sliders1);
   
  String slider2 = str(sliders2);
 if(str(sliders2).length() ==1)
   slider2 = "0" + str(sliders2);
   
 String slider5 = str(sliders5);
 if(str(sliders5).length() ==1)
   slider5 = "0" + str(sliders5);
   
 String slider4 = str(sliders4);
 if(str(sliders4).length() ==1)
   slider4 = "0" + str(sliders4);
 
 //B.Bredican- Creating date paramaters to pass to graphs graphs
 String date= (str(sliders3) + "-" + (slider2) + "-" + (slider1));
 String date1= (str(sliders6) + "-" + (slider5) + "-" + (slider4));
 
 
switch(text){
 case "one":
   graph.mostSharesMoved(5, date);
   break;
 case "two":
 println(uniqueTicker);
   graph.companyPriceChange(uniqueTicker);
   break;
 case "three":
   graph.biggestCompanyChanges(date, date1);
   break;
}
 break;
 case 4:
 queryScreenTwo.setup();
 queryScreenTwo.draw();
 break;

}
}



void mousePressed()
//Switch case for efficiency in changing screens
//P.Kenny
{ 
  switch (screen){
  case 1:
  changeScreen(screenOne.getEvent());
  background(#FFFFFF);
  break;
  case 2:
  changeScreen(screenTwo.getEvent());
  break;
  case 3:
  changeScreen( queryScreenOne.getEvent());
  break;
  case 4:
  changeScreen( queryScreenTwo.getEvent());
  break;
}
// to check if text widget is being tried to be used by the user-K.Jain
  int event;
     for (int i = 0; i < myWidgets.size(); i++)
     {
     Widget theWidget = (Widget)myWidgets.get(i);
     event = theWidget.getEvent(mouseX, mouseY);
     switch(event) {
     case EVENT_TEXT:
     println("clicked on a text widget!");
     focus= (TextWidget)theWidget;
     return; 
     default:
     focus=null;
    }
   }
}
// checks the event occured or the button pressed and accordingly changes screen-K.Jain &P.Kenny
void changeScreen(int eventCode)
{
  switch (eventCode){
    case 1:
    screen=2;
    break;
    case QUERY1PRESSED:
    slider1.hide();
    slider2.hide();
    slider3.hide();
    slider4.hide();
    slider5.hide();
    slider6.hide();
    screen=3;
    break;
    case QUERY2PRESSED:
    slider1.hide();
    slider2.hide();
    slider3.hide();
    slider4.hide();
    slider5.hide();
    slider6.hide();
    screen=4;
    break;
    case RETURNPRESSED:
    screen=1;
    ((Widget)myWidgets.get(0)).setLabel();
    slider1.hide();
    slider2.hide();
    slider3.hide();
    slider4.hide();
    slider5.hide();
    slider6.hide();
    break;
    case RETURN_TO_QUERIES:
    screen=2;
    background(#FFFFFF);
    ((Widget)myWidgets.get(0)).setLabel();
    slider1.hide();
    slider2.hide();
    slider3.hide();
    slider4.hide();
    slider5.hide();
    slider6.hide();
    break;
    case 7:
    checkQuery();
      break;
  }
  // checking selection of radio button for query1-K.Jain & P.Kenny
  int event;
   for (int i = 0; i < radioSet1.size(); i++)
     {
     Widget theWidget = (Widget)radioSet1.get(i);
     event = theWidget.getEvent(mouseX, mouseY);
     switch(event) 
     {
     case QUERY1_R1:
     println("radio1");
     
     uniqueTickers = uniqueTicker(1);
     for (int n = 0; n < uniqueTickers.size(); n++)println(uniqueTickers.get(n).toString());
     return; 
     case QUERY1_R2:
     println("radio2");
     
     uniqueTickers =uniqueTicker(2);
     for (int n = 0; n < uniqueTickers.size(); n++)println(uniqueTickers.get(n).toString());
     return; 
     case QUERY1_R3:
     println("radio3");
     
     uniqueTickers = uniqueTicker(3);
     for (int n = 0; n < uniqueTickers.size(); n++)println(uniqueTickers.get(n).toString());
     return; 
     case QUERY1_R4:
     println("radio4");
     
     uniqueTickers = uniqueTicker(4);
     for (int n = 0; n < uniqueTickers.size(); n++)println(uniqueTickers.get(n).toString());
     return; 
     case QUERY1_R5:
     println("radio5");
     
     uniqueTickers = uniqueTicker(5);
     for (int n = 0; n < uniqueTickers.size(); n++)println(uniqueTickers.get(n).toString());
     return; 
     case QUERY1_R6:
     println("radio6");
     
     uniqueTickers = uniqueTicker(6);
     for (int n = 0; n < uniqueTickers.size(); n++)println(uniqueTickers.get(n).toString());
     return; 
    }
   }
   //check the selection of radio button for query2-K.Jain & P.Kenny
   int event2;
   for (int i = 0; i < radioSet2.size(); i++)
     {
     Widget theWidget = (Widget)radioSet2.get(i);
     event = theWidget.getEvent(mouseX, mouseY);
     switch(event) 
     {
     case QUERY2_R1:
     println("radio1");
     uniqueTicker = "AAPL";
     return; 
     case QUERY2_R2:
     println("radio2");
     uniqueTicker =("AFSI");
     return; 
     case QUERY2_R3:
     println("radio3");
     uniqueTicker=("AHH");
     return; 
     case QUERY2_R4:
     println("radio4");
     uniqueTicker=("AHL");
     return; 
     case QUERY2_R5:
     println("radio5");
     uniqueTicker=("AMSWA");
     return; 
     case QUERY2_R6:
     println("radio6");
     uniqueTicker=("APO");
     return; 
     case QUERY2_R7:
     println("radio7");
     uniqueTicker=("BRFS");
     return; 
     case QUERY2_R8:
     println("radio8");
     uniqueTicker=("CAAS");
     return; 
     case QUERY2_R9:
     println("radio9");
     uniqueTicker=("CCNE");
     return; 
     case QUERY2_R10:
     println("radio10");
     uniqueTicker=("CLWT");
     return; 
     case QUERY2_R11:
     println("radio11");
     uniqueTicker=("CRCM");
     return; 
     case QUERY2_R12:
     println("radio12");
     uniqueTicker=("DSKE");
     return; 
     case QUERY2_R13:
     println("radio13");
     uniqueTicker=("EGHT");
     return; 
     case QUERY2_R14:
     println("radio14");
     uniqueTicker=("FLWS");
     return; 
     case QUERY2_R15:
     println("radio15");
     uniqueTicker=("GHDX");
     return; 
     case QUERY2_R16:
     println("radio16");
     uniqueTicker=("GTN");
     return; 
     case QUERY2_R17:
     println("radio17");
     uniqueTicker=("GTS");
     return; 
     case QUERY2_R18:
     println("radio18");
     uniqueTicker=("GTT");
     return; 
     case QUERY2_R19:
     println("radio19");
     uniqueTicker=("ISTR");
     return; 
     case QUERY2_R20:
     println("radio20");
     uniqueTicker=("MHD");
     return; 
     case QUERY2_R21:
     println("radio21");
     uniqueTicker=("MHF");
     return; 
     case QUERY2_R22:
     println("radio22");
     uniqueTicker=("NSEC");
     return; 
     case QUERY2_R23:
     println("radio23");
     uniqueTicker=("OXLC");
     return; 
     case QUERY2_R24:
     println("radio24");
     uniqueTicker=("PEY");
     return; 
     case QUERY2_R25:
     println("radio25");
     uniqueTicker=("PEZ");
     return; 
     case QUERY2_R26:
     println("radio26");
     uniqueTicker=("RAVN");
     return; 
     case QUERY2_R27:
     println("radio27");
     uniqueTicker=("RRC");
     return; 
     case QUERY2_R28:
     println("radio28");
     uniqueTicker=("RRD");
     return; 
     case QUERY2_R29:
     println("radio29");
     uniqueTicker=("SASSR");
     return; 
     case QUERY2_R30:
     println("radio30");
     uniqueTicker="VIAV";
     return; 
    }
   }
}
// looking at the key pressed in the text widget-K.Jain
void keyPressed(){
if(focus!= null) {
focus.append(key);
}
}

//function to find a user inputted number of unique companies in the dataSet 
// P.kenny
public ArrayList uniqueTicker(int companies){
  ArrayList tickers = new ArrayList <String>();
  boolean unique = true;
  int uniqueTickers = 0;
  while (uniqueTickers <companies){
    int random = int(random(data.size()));
    String ticker = data.get(random).getTicker();
    if(uniqueTickers ==0 ){ 
      tickers.add(ticker);
      uniqueTickers++;
    }
    else{
    for(int j = 0; j < tickers.size(); j++){
      String tickerCompare = tickers.get(j).toString();
      if (ticker.equals(tickerCompare)){
        unique = false;
      }
    }
    if (unique == true){
      tickers.add(ticker);
      uniqueTickers++;
     }else if(unique == false){
     unique = true;
     }
     
  
  }
  }
  return tickers;
}

//checks what query has been selected by the user in text widget and then accordingly show the sub-options-K.Jain
void checkQuery()
{
String text;
text = ((Widget)myWidgets.get(0)).getLabel();
println(text);
 if(text.equalsIgnoreCase("one"))
  {
    //B.Bredican & K.Jain - Implentation of sliders to create date paramaters
    slider1.hide();
    slider2.hide();
    slider3.hide();
   text("You now need to choose the number",480,200);
    text("of companies and date",500,220);
   for(int i = 0; i < radioSet1.size(); i++)
    {
    ((Widget)radioSet1.get(i)).draw();
    slider4.show();
    slider5.show();
    slider6.show();
    text("Day",580,610);
    slider4.addSlider("sliders1").setPosition(670,600).setRange(0,31);
    screenTwo.addSliderToScreen(slider4);
    text("Month",580,510);
    slider5.addSlider("sliders2").setPosition(670,500).setRange(0,12);
    screenTwo.addSliderToScreen(slider5);
    text("Year",580,710);
    slider6.addSlider("sliders3").setPosition(670,700).setRange(1980,2018);
    screenTwo.addSliderToScreen(slider6);
    }
   println("query1");
  }
 else if(text.equalsIgnoreCase("two"))
 {
  text("You now need to choose the company",485,200);
  for(int i = 0; i < radioSet2.size(); i++)
    {
    ((Widget)radioSet2.get(i)).draw();
    }
  println("query2");
 }
 else if(text.equalsIgnoreCase("three"))
 {
   //B.Bredican & K.Jain- Implentation of sliders to create date paramaters
    slider1.show();
    slider2.show();
    slider3.show();
    slider4.show();
    slider5.show();
    slider6.show();
    text("Day",580,210);
    slider1.addSlider("sliders4").setPosition(670,200).setRange(0,31);
    screenTwo.addSliderToScreen(slider1);
    text("Month",580,310);
    slider2.addSlider("sliders5").setPosition(670,300).setRange(0,12);
    screenTwo.addSliderToScreen(slider2);
    text("Year",580,410);
   slider3.addSlider("sliders6").setPosition(670,400).setRange(1980,2018);
    screenTwo.addSliderToScreen(slider3);
    text("Select second date",500,480);
    text("Day",580,610);
    slider4.addSlider("sliders1").setPosition(670,600).setRange(0,31);
    screenTwo.addSliderToScreen(slider4);
    text("Month",580,510);
    slider5.addSlider("sliders2").setPosition(670,500).setRange(0,12);
    screenTwo.addSliderToScreen(slider5);
    text("Year",580,710);
    slider6.addSlider("sliders3").setPosition(670,700).setRange(1980,2018);
    screenTwo.addSliderToScreen(slider6);
  println("query3");
 }
}
