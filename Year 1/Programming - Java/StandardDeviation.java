
import java.util.Arrays;
import java.util.Scanner;



public class StandardDeviation {
    public static final int NUM_OF_TERMS=10;
	public static void main(String[] args)
	{
		// TODO Auto-generated method stub
		Scanner input= new Scanner(System.in);
		
		 System.out.print("enter the numbers");
		 double[]arrayX = new double[NUM_OF_TERMS]; 
		 for (int index=0;index<NUM_OF_TERMS;index++)
		 {
		 
			 arrayX[index]=input.nextDouble();
		 }
	    	  mean(arrayX);
	    	 System.out.println(deviation( arrayX));
	}
   public static double mean(double[]arrayX)
   {
	   double total=0.0;
	   double meanIs=0.0; 
	   for (int index=0;index<=arrayX.length-1;index++)
	   {
		double digit=arrayX[index]; 
		total= total+digit;
	   }
	   meanIs = total/NUM_OF_TERMS;
	return meanIs;
	   
   }
   public static double deviation(double[]arrayX)
   {
	   double totalReq=0.0;
	   double mean= mean(arrayX);
	   for(int index=0;index<=arrayX.length-1;index++)
	   {
		   double sumForDev= arrayX[index]- mean;
		   double squareOfabove= sumForDev * sumForDev;
		    totalReq=totalReq+squareOfabove;
	   }
	   double divide= totalReq/(arrayX.length-1);
	   double sDeviation=Math.sqrt(divide);
	return sDeviation;
	   
   }
}
