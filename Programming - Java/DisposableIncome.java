/* SELF ASSESSMENT
   1. Did I use easy-to-understand meaningful variable and CONSTANT names? 
       Mark out of 10: 10
       Comment:The constants and variable names are easy to understand and related to the information
   2. Did I format the variable and CONSTANT names properly (in lowerCamelCase and UPPERCASE_WITH_UNDERSCORES)?
       Mark out of 10: 10
       Comment:Are properly cased  
   3. Did I indent the code appropriately?
       Mark out of 10:9
       Comment:Indentation has been kept track of so its easier to understand the program
   4. Did I read the input correctly from the user using appropriate questions?
       Mark out of 15: 15
       Comment:Yes the inputs from the users have been taken correctly with apt questions
   5. Did I computer the disposable income and disposable income percentage correctly, and output it in the correct format?
       Mark out of 15:15
       Comment: The above have been computed and displayed in the  correct manner
  6. Did I use an appropriate series of if statements to generate the income analysis to the user?
       Mark out of 25:24
       Comment:An apt series of if statements have been used that is, if.. else if... else
   7. Did I provide the correct output for each possibility in an easy to read format?
       Mark out of 10:9
       Comment:The correct output has been provided for each possibility which is understandable
   8. How well did I complete this self-assessment?
       Mark out of 5: 5
       Comment: Has been done nicely and fair
   Total Mark out of 100 (Add all the previous marks):97
*/
   package disposableIncome;
 
   import java.util.Scanner;

   public class DisposableIncome {
	
	  public static final double INCOME_TAX = 0.35 ;
	  public static final double AVG_DISPOSABLE_INCOME=500.0;
	  public static final double MORE_AVG_DISPOSABLE_INCOME=750.0;
	  public static final String MUCH_MORE= "much more than the average";
	  public static final double LESS_AVG_DISPOSABLE_INCOME=250.0;
	  public static final String MUCH_LESS= "much less than the average ";
	  public static final double NO_DISPOSABLE_INCOME = 0;
	  public static final String NO = "no ";
	  public static final String MORE = "more than the average";
	  public static final String LESS = "less than the average ";
	  public static final String EQUAL ="equal to the average " ;
	 
	  public static void main(String[] args) 
	   {
       Scanner inputScanner = new Scanner (System.in);
       System.out.print("Enter how much you are paid in  a month before tax ?");
       double grossIncome = inputScanner.nextDouble();
    
       System.out.print("Enter how much you pay in rent/mortgage a month?");
       double rent = inputScanner.nextDouble();
    
       System.out.print("Enter how much does your commute cost a month?");
       double commute = inputScanner.nextDouble();
    
       System.out.print("Enter how much you spend on food in a month?");
       double food = inputScanner.nextDouble();
       inputScanner.close();
   
    
       double incomePostTax = grossIncome - (grossIncome * INCOME_TAX);
       double disposableIncome = incomePostTax - rent - commute - food;
       double percentOfDisposableIncome= disposableIncome/ grossIncome * 100 ;
    
       System.out.println("The disposable income is $"+disposableIncome +" which is "+percentOfDisposableIncome +"% of your salary"  );
       
       String disposableIncomeClassification = " ";
       if (disposableIncome >MORE_AVG_DISPOSABLE_INCOME)
       {
    	   disposableIncomeClassification = MUCH_MORE ;
    	 }
       else if (disposableIncome > AVG_DISPOSABLE_INCOME && disposableIncome < MORE_AVG_DISPOSABLE_INCOME )
       {
    	   disposableIncomeClassification = MORE ;
       }
       else if ( disposableIncome < AVG_DISPOSABLE_INCOME  && disposableIncome >LESS_AVG_DISPOSABLE_INCOME )
       {
    	   disposableIncomeClassification = LESS ;
       }
       
       else if(disposableIncome > NO_DISPOSABLE_INCOME  && disposableIncome < LESS_AVG_DISPOSABLE_INCOME)
       {
    	   disposableIncomeClassification = MUCH_LESS ;
       }
       else if (disposableIncome == AVG_DISPOSABLE_INCOME)
       {
    	   disposableIncomeClassification = EQUAL ;
       }
       
       else
       {
    	   disposableIncomeClassification = NO ;
       }
       System.out.println("You have  " + disposableIncomeClassification + " disposable income  per month" );
     }
}
   


