package mortgageCalculator;

import java.util.Scanner;

public class prompt {
	public static double readDoubleFromUser(String question)
	 {
		// TODO Auto-generated method stub
		double result=0.0;
		Scanner input= new Scanner(System.in);
		System.out.print(question);
		if(!input.hasNextDouble())
		{
			result= readDoubleFromUser(question);
		}
		else
		{
			result=input.nextDouble();
		}
			return result;			
	 }
}
