/*
This class is to obtain data for the graphs and draw them, calss made by Ryan Ting
*/

import java.util.LinkedList;

class Graph {

  ArrayList<stockData> dataList;

  Graph (ArrayList<stockData> data) {    
    dataList = data;
  }
//constructor is used to pass in the data

//This method is for the first query, it is to find the shares(in terms of value) which was moved the moved in that day
  void mostSharesMoved(int x, String date) //x is the top x(e.g.5) valuable firms
  { 

    LinkedList<Float> amountMoved = new LinkedList<Float>(); //linked list to keep the amount moved for each company
    while(amountMoved.size() < x+1)
      amountMoved.add((float)0);    
    LinkedList <String>tickers = new LinkedList(); //linked list of tickers that correspond to the first linked list
    while(tickers.size() < x+1)
      tickers.add((String)"");    

    int i = 0;
    while (i < dataList.size() - 1) {
      while (amountMoved.size() > x) 
      {
        amountMoved.removeLast();  //To remove the last element if it is not in the top x amount of companies
        tickers.removeLast();
      }
      String getDate = dataList.get(i).getDate();
      if (date.equals(getDate))     //This is to get the date of each line to compare it to the date inputted by the user
      {
        float amount = dataList.get(i).getClosePrice() * dataList.get(i).getVolume();
        String name = dataList.get(i).getTicker();    //Calculates amount moved in that day of that company
        int count = 0;

        while (amount < amountMoved.get(count) && count<x)
        {
          count++;        //puts the value fouund in the right (ascending) order
        }
        amountMoved.set(count, amount);
        tickers.set(count, name);
      }
      i++;
    }
    scale(amountMoved, tickers, "Value-amount of shares moved in a day", "$");
  }
  
  void companyPriceChange(String ticker) {   //method to find the second query: How the price of a share of a company has changed in the last 3 months
    
   LinkedList<Float> price = new LinkedList<Float>();
   LinkedList<String> date = new LinkedList<String>();

   
   int i = 0;
   while (i < dataList.size() - 1) {
     
      String getTicker = dataList.get(i).getTicker();  //gets the ticker from the data to see if it is the same as the one inputted
      if (ticker.equals(getTicker)) 
      {
        Float currentPrice = dataList.get(i).getClosePrice();
        price.add(currentPrice);                                  //if ticker is the same, get price and date
        String currentDate = dataList.get(i).getDate();
        date.add(currentDate);
      }
      i++;
    }
    while(price.size() > 90)
    {
        price.removeFirst();  //useed to find the most recent 90 entries in the dataset
        date.removeFirst();
    }
    
    scale(price, date, "Company price change over time(3 months)", "$");
  }
  
  void biggestCompanyChanges(String date1, String date2) {    //Method for third query
    
    
   LinkedList<Float> percentageChange = new LinkedList<Float>();
   percentageChange.add(0, 0.0);
   LinkedList<String> tickers = new LinkedList<String>();    //To store the percentage change and tickers that correspond
   tickers.add("");
   

   int i = 0;
   while(i < dataList.size()-1) 
   {
       String previousDate = dataList.get(i).getDate();
       float previousPrice = dataList.get(i).getClosePrice();    //Gets previous date and see if it matches up

       if(date1.equals(previousDate))
       {
           String currentTicker = dataList.get(i).getTicker();
           int count = 0;
           while(count < dataList.size()-1)
           {
             String tickerMatch = dataList.get(count).getTicker();
             String dateMatch = dataList.get(count).getDate();          //If the date matches, go find the second date with the same company
                if (tickerMatch.equals(currentTicker) && dateMatch.equals(date2)) //<>//
                {
                  
                    int LLCount=0;
                    float lastPrice = dataList.get(count).getClosePrice();
                    float currentPercentageChange = ((lastPrice-previousPrice)/previousPrice)*100;    //If there are 2 dates with the comany, find the percentage date
                    
                    while(currentPercentageChange < percentageChange.get(LLCount) && LLCount < percentageChange.size()-1)
                    {
                      LLCount++;    //to put it into the right order
                    }
                    
                    percentageChange.add(LLCount, currentPercentageChange);
                    tickers.add(LLCount, dataList.get(count).getTicker());
                }
                count++;
           }
       }
       i++;
   }
   while(percentageChange.size()>6)
   {
      percentageChange.removeLast();
      tickers.removeLast();        //to make it the top 5 changes
   }
   percentageChange.removeFirst();
   tickers.removeFirst();

   
   
   
    
    scale(percentageChange, tickers, "Largest Percentage change of share price between 2 dates", "%");
  }

  void scale(LinkedList<Float> data, LinkedList<String> tickers, String title, String preface) {    //this method is to scale all the data so it can be drawn on the graph as the data is normally too big
    int i = 0;
    int multiplier = 1;

  if(data.get(0) > 600)
  {
      while (data.get(0) > 600)
      {
        i = 0;
        multiplier = multiplier*10;
        while (i < data.size())
        {
          Float amount = data.get(i);      //This gets all the data points into the correct scale
          amount = amount/10;
          data.set(i, amount);
          i++;
          
        }
      }
  }
  else
  {
     while (data.get(0) < 10)
      {
        i = 0;
  
        while (i < data.size())
        {
          Float amount = data.get(i);      //This gets all the data points into the correct scale
          amount = amount*10;
          data.set(i, amount);
          i++;
  
        }
      }
  }
    draw(data, tickers, multiplier, title, preface);

  }
  
  void draw(LinkedList<Float> data, LinkedList<String> tickers, int multiplier
  , String title, String preface) {    //This is to draw the graph
    
    int graphColor = 0; //<>//
    int i = 0;
    float x = 100;
    float diff = 600/data.size();
    textSize(20);
    text(title, 200, 100);
    while(i<data.size())
    {
      graphColor=200;

      fill(graphColor, graphColor, graphColor); 
      
      if(preface.equals("%"))
        rect(x, 375, 600/data.size(), (-data.get(i)));
       else
       {
        rect(x, 600, 600/data.size(), (-data.get(i)));
        text("price x" + multiplier + "$", 300, 750);
       }

      if(data.size() < 10)
      {
        textSize(20);
        text(tickers.get(i), x+35, 650);
        textSize(15);
        float graphData = data.get(i) * 10000;
        int rGraphData = round(graphData);    //To round so the numbers are not too big
        graphData = float(rGraphData)/10000;
        text(preface + graphData, x+35, 675);
      }
      else if(data.size() > 10 && i%18 == 0)
      {
        fill(0);
          textSize(13);
          text(tickers.get(i), x-45, 650);
          text(tickers.get(89), 640-45, 650);
          text(data.get(i), x-45, 700);
          text(data.get(89), 640-45, 700);
          textSize(26);
      }
      
      x = x+diff;
      i++;
    }
      
    
   
    
  }
  
  
  
  
  
}
