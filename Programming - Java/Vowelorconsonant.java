package vowelorconsonant;

import java.util.Scanner;

public class Vowelorconsonant {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
      Scanner input = new Scanner(System.in) ;
      System.out.print("enter an alphabet");
      String userInput = input.next();
      int length = userInput.length();
      
      if (length>1)
      {
    	  System.out.print("enter a valid input that is only one character");
      }
      else 
      {
    	  
      if(userInput=="A"||userInput=="E"||userInput=="I"||userInput=="O"||userInput=="U"||userInput=="a"||
    		  userInput=="i"||userInput=="o"||userInput=="u"||userInput=="e")
      {
    	  System.out.print("its a vowel");
      }
      else
      {
    	  System.out.print("its a consonant");
      }
      }
	}

}
