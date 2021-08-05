/* SELF ASSESSMENT

 1. Did I use easy-to-understand meaningful properly formatted, variable names and CONSTANTS?
        Mark out of 10: 10
        Comment:   easy to understand n apt variable and constant  names have been used with proper formatting
 2. Did I indent the code appropriately?
        Mark out of 5: 4
        Comment:   has been intended fine  
 3. Did I implement the mainline correctly with a loop which continues using the user says "no" ?
       Mark out of 10: 9
        Comment:  A while loop has been used to check that
 4. Did I obtain the relevant inputs from the user and produce the relevant outputs using the specified prompts & formats ?
       Mark out of 10: 9
        Comment:  proper prompts and formats have been used as specified  
 5. Did I implement the readDoubleFromUser function correctly and in a manner that can be easily understood (4 marks for function definition, 4 marks for function call and 12 marks for function implementation)?
       Mark out of 20: 19
        Comment:  has been called correctly , checks whether a double or not and returns the output
 6. Did I implement the calculateMonthlyRepayment function correctly in a manner that can be easily understood (4 marks for function definition, 4 marks for function call and 12 marks for function implementation)?
       Mark out of 20: 20
        Comment:  has been called and correctly calculates the monthly repayment and is properly  defined
 7. Did I implement the calculateMonthsToRepayMortgage function correctly in a manner that can be easily understood (4 marks for function definition, 4 marks for function call and 12 marks for function implementation)?
       Mark out of 20: 19
        Comment:  correctly calculates,properly called as well displays output in correct form  
 8. How well did I complete this self-assessment?
        Mark out of 5: 5
        Comment:fair enough
 Total Mark out of 100 (Add all the previous marks):95
*/ 
package mortgageCalculator;

import java.util.Scanner;

public class mortgageCalculator {
    public static final int DURATION = 20;
    public static final int NUM_MONTHS_IN_YEAR=12;
	public static void main(String[] args)
	{
		// TODO Auto-generated method stub
	System.out.println("Welcome to the mortage calculator.");
	boolean finished = false;
	
	while(finished==false)
	{
     String question= ("enter the mortgage amount");
     double principal = prompt.readDoubleFromUser(question);
    
     question =("Please enter the annual interest rate (APR)");
     double annualInterestRate =prompt.readDoubleFromUser(question);
    
     System.out.println("Assuming a " + DURATION + " year term, the monthly repayments would be " + calculateMonthlyRepayment(principal , annualInterestRate))  ;
    
  
     question=("How much can you afford to pay per month? ");
     double repay = prompt.readDoubleFromUser(question);
    
     int  yearsTakenToRepay= calculateMonthsToRepayMortgage(principal,annualInterestRate,repay)/12;
     int  monthsTakenToRepay = calculateMonthsToRepayMortgage(principal,annualInterestRate,repay)%12;
     System.out.println("If you pay " +repay + "per month your mortgage would be paid off in " + yearsTakenToRepay +" years" +" and "+ monthsTakenToRepay + " months");
   
     boolean repeat=false;
     while(repeat==false)
     {
      Scanner input1= new Scanner(System.in);
      System.out.print("Would you like to use the mortgage calculator again (yes/no)");
      if(input1.hasNext("no"))
       {
    	finished=true;
    	repeat=true;
       }
      else if (input1.hasNext("yes"))
       {  
    	finished=false;
    	repeat=true;
       }
      else
      {
    	finished=false;
    	repeat=false;
      }
     }
	 }
	}
	
	public static double calculateMonthlyRepayment(double principal, double  annualInterestRate )
	{
		// TODO Auto-generated method stub
		double monthlyRepayment = principal*((annualInterestRate/NUM_MONTHS_IN_YEAR/100)/ (1- Math.pow((1+annualInterestRate/NUM_MONTHS_IN_YEAR/100),(-DURATION * NUM_MONTHS_IN_YEAR))));
		return (double)Math.round(monthlyRepayment*100)/100.0;
	}
	public static int calculateMonthsToRepayMortgage(double principal, double annualInterestRate, double repay)
	{
		// TODO Auto-generated method stub
		int months=0;
		double loan = principal;
		while (loan>=0)
		{
		  loan = loan +(loan *(annualInterestRate/NUM_MONTHS_IN_YEAR/100)) - repay;
		  months++;
		}
		return months ;
	}
}
