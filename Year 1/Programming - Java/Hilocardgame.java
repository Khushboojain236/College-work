/* SELF ASSESSMENT
   1. Did I use appropriate CONSTANTS instead of numbers within the code?
       Mark out of 5:5
       Comment:Apt constants have been used to ensure that numbers are not  present within the code
   2. Did I use easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE?
       Mark out of 5:5
       Comment:Meaningful and related  constant names have been used  
   3. Did I use easy-to-understand meaningful variable names?
       Mark out of 10:10
       Comment: Meaningful and related  variable  names have been used 
   4. Did I format the variable names properly (in lowerCamelCase)?
       Mark out of 5: 5
       Comment: Are aptly cased in the lowerCamelCase format
   5. Did I indent the code appropriately?
       Mark out of 10:9
       Comment: The indent is fairly proper making sure brackets are in perfect line
   6. Did I use an appropriate loop to allow the user to enter their guesses until they win or lose?
       Mark out of 20: 19
       Comment: While loop has been used to make sure that the user is allowed to enter their guesses until they win or lose
   7. Did I check the input to ensure that invalid input was handled appropriately?
       Mark out of 10: 9
       Comment: The validity of input has been checked using if..else statement 
   8. Did I generate the cards properly using random number generation (assuming all cards are equally likely each time)?
       Mark out of 10: 9
       Comment: The cards have been generated properly with each given a fair chance
   9. Did I output the cards correctly as 2, 3, 4, ... 9, 10, Jack, Queen, King?
       Mark out of 10: 10
       Comment: The cards have been correctly output as 2,3,4`...King, the function computeAnswer has been used 
   10. Did I report whether the user won or lost the game before the program finished?
       Mark out of 10:10
       Comment: Yes , the user is informed whether user wins or lost before the program ends
   11. How well did I complete this self-assessment?
       Mark out of 5:5
       Comment: The self-assessment has been fairly and nicely completed
   Total Mark out of 100 (Add all the previous marks):96
*/
package hilocardgame;

import java.util.Random;
import java.util.Scanner;

public class Hilocardgame 
{
  public static final int MIN_NUMBER = 2;
  public static final int MAX_NUMBER=14;
  public static final int ACE = 14;
  public static final int KING = 13;
  public static final int QUEEN=12;
  public static final int JACK = 11;
  public static final int TO_WIN = 4;
  public static void main(String[] args) 
  {
		// TODO Auto-generated method stub

	int  i= 0;
	int userWin=0;
	String computerChoice=" ";
	Random intialGenerator = new Random ();
  int intialComputerChosen = intialGenerator.nextInt ((MAX_NUMBER - MIN_NUMBER )+1) + MIN_NUMBER ;
  String intialComputerChose = (intialComputerChosen==KING?"King":intialComputerChosen==QUEEN?"Queen":intialComputerChosen== JACK ?"Jack" :
    	intialComputerChosen== ACE ?"Ace": " ");
    if (intialComputerChose == " ")
    {
    	System.out.println("The card is a " + intialComputerChosen ) ;
    }
    else
    {
      System.out.println("The card is a " + intialComputerChose );
    }
    
    
    int computerChosen=0;
    int cardDrawn=0;
	  while (userWin< TO_WIN )
	   {
     Scanner input= new Scanner (System.in);
     System.out.print("Do you think the next card will be higher, lower or equal?");
     String userGuess = input.next(); 
     Scanner test = new Scanner (userGuess);
     
     if (test.hasNext("higher") || test.hasNext("lower") || test.hasNext("equal"))
     {
      Random generator = new Random ();
      computerChosen = generator.nextInt((MAX_NUMBER - MIN_NUMBER )+1)+ MIN_NUMBER;
     
   
      if (i==0)
       {
        if((computerChosen) > (intialComputerChosen) && test.hasNext("higher"))
        {
    	 userWin++;
        }
        else if((computerChosen) < (intialComputerChosen ) && test.hasNext("lower"))
        {
    	 userWin++;
        }
        else if((computerChosen)==(intialComputerChosen) && test.hasNext("equal"))
        {
    	 userWin++;
        }
        else 
        {
    	 break;
        }
      computerChoice =  computeAnswer(computerChosen);
	    i++ ;
	    cardDrawn = computerChosen;
       }
     
      else
	    {
		   if((computerChosen)>(cardDrawn) && test.hasNext("higher"))
		    {
	    	userWin++;
		    }
	     else if ((computerChosen) == (cardDrawn) && test.hasNext("equal"))
	      {
	    	userWin++;
	      }
	     else if ((computerChosen)< (cardDrawn) && test.hasNext("lower"))
	     {
	    	userWin++;
	     }
	     else
	     {
	    	break;
	     }
       computerChoice = computeAnswer(computerChosen);
	     i++ ;
	     cardDrawn = computerChosen;
	    }
     }
     
	   else
	   {
	    System.out.println("enter a valid input");
	    }
     }
	
   if(userWin==TO_WIN )
	 {
	  System.out.print("Congratulations! You got them all correct");
	 }
	 else 
	 {
		computerChoice=computeAnswer(computerChosen);
    System.out.print(" You lost! You didn't guess correctly");
	 }
  } 
	
	
	
	public static String computeAnswer(int computerChosen)
    {
		// TODO Auto-generated method stub

	   String computerChoice = (computerChosen == KING?"King":computerChosen==QUEEN?"Queen":computerChosen== JACK ?"Jack" :
	     	computerChosen== ACE ?"Ace" : " ");
	   if (computerChoice == " ")
	    {
	    	System.out.println("The card is a " + computerChosen ) ;
	    }
	   else
	    {
	    System.out.println("The card is a " + computerChoice );
	    }
	   return computerChoice;
	  }
}


    

	
