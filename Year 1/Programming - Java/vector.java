package vector;

import java.util.Scanner;

public class vector {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
      
	Scanner input= new Scanner (System.in);
	System.out.print("enter ");
	double[]vectorInput= {0.0} ;
	
	System.out.print("enter ");
	double[]vectorInput1= {0.0} ;
	
	
	double magnitude= calcMagnitude(vectorInput);
	
      calcNormalise(vectorInput);
	
	double dotProduct=calcDotproduct(vectorInput,vectorInput1);
	
	double[] newVector=calcNewvector(vectorInput,vectorInput1);
	}

	public static double []calcNewvector(double[] vectorInput, double[] vectorInput1) {
		double[] result = new double[vectorInput.length];
		for (int index=0; index<vectorInput.length; index++)
		{
			result[index]= vectorInput[index] + vectorInput1[index];
		}
		return result;
		// TODO Auto-generated method stub
		
	}

	public static double calcDotproduct(double[] vectorInput, double[] vectorInput1) {
		// TODO Auto-generated method stub
		double dotproduct=0;
		for (int index=0;index<=vectorInput.length-1;index++)
		{
			double product= vectorInput[index] * vectorInput1[index];
			 dotproduct=+ product;
		}
		return dotproduct;
	}

	public static void calcNormalise(double[] vectorInput) {
		// TODO Auto-generated method stub
		
		double magnitude=calcMagnitude(vectorInput);
		for (int index=0;index<=vectorInput.length-1;index++)
		{
		vectorInput[index]  = vectorInput[index]/magnitude;
		}
	}
	public static double calcMagnitude(double[] vectorInput) {
		// TODO Auto-generated method stub
		double squareSum=0;
		for (int index=0;index<=vectorInput.length-1;index++)
		{
			double square = vectorInput[index] * vectorInput[index];
			 squareSum =+ square;
		}
		double  magnitude = Math.sqrt(squareSum);
		
		return magnitude;
	}

}
