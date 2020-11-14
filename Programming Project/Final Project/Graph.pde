import java.util.LinkedList;

class Graph {
  
  ArrayList<stockData> dataList;
  
  
  Graph (ArrayList<stockData> data) {
    
    dataList = data;
    
  }
  
  
  void mostSharesMoved(int x, String date ) //x is the top x(e.g.5) valuable firms
  {    
    LinkedList amountMoved = new LinkedList();
    amountMoved.add((float)0);    
    LinkedList tickers = new LinkedList();

    int i = 0;
    
    while(i < dataList.size() - 1) {
      
      if(date.equals(dataList.get(i).getDate())) 
      {
        float amount = dataList.get(i).getClosePrice() * dataList.get(i).getVolume();
        int count = 0;
        
        
        
      }
      
      i++;
    }
    
    
  }
/*
First, go through the data and find an entry with the same date required
Then, get the amount of that stock moved in that date(close_price * volume)
Then keep adding the amouont to linked list if they are in the top x amount
Add the ticker along side the linked list, at the same spot, different list

*/
  
  
}
