class stockData {
  String ticker;
  float openPrice;
  float closePrice;
  float adjustedClose;
  float low;
  float high;
  int volume;
  String date;

  stockData(String inputTicker, float inputOpenPrice, float inputClosePrice,
            float intputAdjustedClose, float inputLow,
            float inputHigh, int inputVolume, String inputDate)
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
      
    double getLow(){
      return low;
      
    }
    
    double getHigh(){
      return high;
    }
  
    int getVolume(){
      return volume;
    }
    
    String getDate(){
      return date;
    }
}
