package averagenvariance;

import java.util.Scanner;

public class Averagenvariance {
    public static final  String QUIT = "exit";
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
    double prevUserEnter= 0;
    double prevAverage=0;
	int n= 1;
	double  average = 0 ;
    double variance = 0;
    String userInput = null ;
    
    for (n=1; userInput != QUIT  ;n++) 
    {
	Scanner input=  new Scanner (System.in);
    System.out.print("enter a number or(type 'exit'):");
     userInput =input.next() ;
 
     Scanner test = new Scanner (userInput);
     if (test.hasNext( QUIT) )
     {
    	 System.out.print("Goodbye!");
        break ;
     }
          else
       {
    	 int userEnter = Integer.parseInt(userInput);
    	 average= average +((userEnter - average)/n);
    	 variance= ((variance * prevUserEnter) + ((userEnter - prevAverage )* (userEnter - average)))/n;
          prevUserEnter = userEnter ;
	      prevAverage = average ; 
	      System.out.println("the average is " + average + "and the variance is" + variance);
       }
}
}
}





