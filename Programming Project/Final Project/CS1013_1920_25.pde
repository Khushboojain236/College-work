Table rawData;
ArrayList <StockData> stockData;

void setup(){
  rawData =loadTable("daily_prices100k.csv", "header");
  println(rawData.getRowCount() + "total rows in table");
  stockData = new ArrayList <StockData>;
  readInData(stockData rawData);
} //<>// //<>// //<>// //<>// //<>//
ArrayList readInData(ArrayList stockData Table rawData){
     for (TableRow row :rawData.rows()){
      String ticker = row.getString(0);
      double open = row.getDouble(1);
      double close = row.getDouble(2);
      float adj_close = row.getFloat(3);
      double low = row.getDouble(4);
      double high = row.getDouble(5);
      int volume = row.getInt(6);
      String date = row.getString(7);
      stockData.add(new StockData(ticker, open, close, adj_close,low,high,volume,date));
      } 
}
