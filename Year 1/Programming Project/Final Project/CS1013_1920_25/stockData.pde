//R.Ting & B.Bredican- class to for stock data with get methods
class stockData {
  String ticker;
  float openPrice;
  float closePrice;
  float adjustedClose;
  float low;
  float high;
  float volume;
  String date;
  PFont myFont;
  stockData(String inputTicker, Float inputOpenPrice, float inputClosePrice,
            float intputAdjustedClose, float inputLow,
            float inputHigh, float inputVolume, String inputDate)
    {
      ticker = inputTicker;
      openPrice = inputOpenPrice;
      closePrice = inputClosePrice;
      adjustedClose = intputAdjustedClose;    //Did this to make all the variables local
      low = inputLow;
      high = inputHigh;
      volume = inputVolume;
      date = inputDate;
    }
      
    String getTicker () {
      return ticker;
    }
    
    float getOpenPrice () {
      return openPrice;
    }
    
    float getClosePrice () {
      return closePrice;
    }
    
    float getAdjustedClose () {
      return adjustedClose;
    }    
      
    float getLow(){
      return low;
      
    }
    
    float getHigh(){
      return high;
    }
  
    float getVolume(){
      return volume;
    }
    
    String getDate(){
      return date;
    }
     void display()
     {
       println(String.format(ticker +","+openPrice+"," +closePrice+","+adjustedClose+"," +low +"," +high+"," +volume +"," +date));
     }
}
