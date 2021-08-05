/* SELF ASSESSMENT
   1. Did I use appropriate easy-to-understand, meaningful variables and CONSTANTS within the code? 
       Mark out of 10: 9
       Comment:The variable and constant names are related to what they depict
   2. Did I format the variable and CONSTANT names appropriate (in lowerCamelCase and UPPERCASE)?
       Mark out of 5:5
       Comment: Yeah they are properly cased
   3. Did I generate the computer's choice in each game correctly using a Random number generator?
       Mark out of 10: 9
       Comment: Yes as it should be present in the for loop so every time a new value is assigned
   4. Did I input the user's choice in each game correctly?
       Mark out of 10:10
       Comment:Yes the user's input  has been taken every time with apt question
   5. Did I correctly compare the choices and update the score appropriately?
       Mark out of 20:19
       Comment: Yes the choices have been compared using if.. else if..else loop and score is correctly calculated 
   6. Did I inform the user of who won each game (and why) correctly?
       Mark out of 10: 10
       Comment:As at end of every turn the result is printed with informing the user what option was chosen by computer
   7. Did I use an appropriate for loop to allow the player to play 5 games?  There should be only one loop.
       Mark out of 20: 20
       Comment:Yes there is only one for loop and the player is allowed to play five times 
   8. Did I output the final scores correctly after the 5 games were played. 
       Mark out of 10: 10
       Comment: The last statement states how many times did the user win and the computer did  
   9. How well did I complete this self-assessment?
       Mark out of 5: 5
       Comment:has been carefully attempted with effort of keeping the code simple and easy
   Total Mark out of 100 (Add all the previous marks):97
*/


import java.util.Random;
import java.util.Scanner;

public class rockPaperScissor {
	
	public static final int NUM_OF_TURNS = 5;
	public static final int ROCK = 1;
	public static final int PAPER= 2;
	public static final int SCISSORS = 3;
	public static final int MAX_NUMBER = 3;
	
	public static void main(String[] args) {
      int count;
      int userWin= 0;
 	  int computerWin=0;
      for (count=0; (count < NUM_OF_TURNS)  ;count++ )
      {
    	 Random generator = new Random ();
         int computerChoosen = generator.nextInt(MAX_NUMBER )+1;
        
         
    	 Scanner input = new Scanner (System.in);
    	 System.out.print("Enter 1 (for Rock) or 2 (for Paper) or 3 (for Scissors)");
    	 int userChoosen = input.nextInt();
    	 
    	 String  computerChose=(computerChoosen == 1? "Rock" : computerChoosen == 2? "Paper" : "Scissors");
    	 
    	 if ((computerChoosen == ROCK && userChoosen == PAPER )||
    		 (computerChoosen== PAPER && userChoosen== SCISSORS) ||
    	     (computerChoosen== SCISSORS && userChoosen== ROCK)) 
    	   {
    		 userWin ++;
    		 System.out.println("You win this round as I chose "+ computerChose); 
    	   }
    	 else if ((computerChoosen == PAPER && userChoosen == ROCK ) ||
    			  (computerChoosen== SCISSORS && userChoosen== PAPER) ||
    			  (computerChoosen== ROCK && userChoosen== SCISSORS))
    	   {
    		 computerWin++;
    		 System.out.println("You lost this round as I chose " + computerChose);
    	   }
    	 else 
    	 {
    		 System.out.println("This round is a draw as  I chose " + computerChose + " too");
    	 }
       }
      System.out.println( "The final score was  Computer : " + computerWin + "User : " + userWin );
	}
	
}
