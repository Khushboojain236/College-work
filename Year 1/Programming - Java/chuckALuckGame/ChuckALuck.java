/* SELF ASSESSMENT 

1. ResolveBet

I have correctly defined ResolveBet which takes the bet type (String) and the Wallet object, and a void return type [Mark out of 7: ].7
Comment:is defined in a right way with the 2 parameters
My program presents the amount of cash in the wallet and asks the user how much he/she would like to bet [Mark out of 8: ].7
Comment:it does present n ask
My program ensures the bet amount is not greater than the cash in the wallet [Mark out of 5: ].5
Comment:it ensures bet money ain't greater than amount present in wallet
My program creates three Dice objects, rolls them and creates a total variable with a summation of the roll values returned [Mark out of 15: ]..14
Comment:does create and do what is asked for
My program determines the winnings by comparing the bet type with the total and comparing the bet type with the dice faces for the triple bet [Mark out of 20: ].19
Comment:does that for all the kinds
My program outputs the results (win or loss) and adds the winnings to the wallet if user wins or removes the bet amount from the wallet if the user loses [Mark out of 10: ].10
Comment:does so accurately

2. Main

I ask the user for the amount of cash he/she has, create a Wallet object and put this cash into it [Mark out of 15: ]15
Comment:does that
My program loops continuously until the user either enters quit or the cash in the wallet is 0 [Mark out of 5: ]5
Comment:does the asked
I ask the user to enter any of the four bet types or quit [Mark out of 5: ].5
Comment:ask n make sure right bet type is input
My program calls resolveBet for each bet type entered [Mark out of 5: ].5
Comment:calls for all
At the end of the game my program presents a summary message regarding winnings and losses [Mark out of 5: ]4
Comment:presents a summary

 Total Mark out of 100 (Add all the previous marks):96
*/


package chuckALuckGame;

import java.util.Scanner;

public class ChuckALuck {
	
	public static double initialCash=0.0;
	public static double finalCash;
	public static final String QUIT= "quit";
	public static final String TRIPLE= "triple";
	public static final String HIGH= "high";
	public static final String LOW= "low";
	public static final String FIELD= "field";
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	  Wallet playerWallet= new Wallet(); 
	  Scanner input =  new Scanner(System.in);
	  System.out.print("How much cash do you want to put in your wallet? ");
	  
	  
	  if(input.hasNextDouble())
	   {
		  initialCash = input.nextDouble();
		  playerWallet.put(initialCash);
	  
	   } 
	  else
	  {
		  System.out.println(" atleast enter a sensible amount");
	  }
	  boolean finished=false;
	  while(finished==false)
	  {
		  if(playerWallet.check()<=0.0)
		  {
			  finished=true;
			  finalCash=playerWallet.check();
		  }
		  else
		  {
			  System.out.println("Choose out of the four bets(Triple,High,Low or Field) or enter quit"); 
			  if (input.hasNext(QUIT))
			  {
				  finished=true;
				  finalCash=playerWallet.check();
			  }
			  else 
			  {
				  String bet=input.next();
				  if(bet.equals("triple")||bet.equals("high")||bet.equals("low")||bet.equals("field"))
				  {
					  ResolveBet(bet,playerWallet);  
				  }
				  else
				  {
					  System.out.println("enter a valid type");
				  }
			  }
		  }
	  }
	  
	  if(initialCash<finalCash)
		{
		  System.out.print("you won "+ (finalCash-initialCash ));
		}
	  else if(initialCash>finalCash)
		{
		  System.out.print("you lost"+ (initialCash-finalCash ));
		}
	  else
		{
		  System.out.print("You broke even as final cash you are left with is equal to the one you started with." );
		}
    }

	public static void ResolveBet(String betPlaced, Wallet walletPlayer) {
		// TODO Auto-generated method stub
		double moneyBet=0.0;
		System.out.println("Money you have in your wallet" + walletPlayer.check());
		Scanner inputMoney =new Scanner(System.in);
		System.out.println("How much money do you want to bet?");
		Dice[]dice=new Dice[3];
		int[] rolls= new int[3];
		
		 if (inputMoney.hasNextInt())
		  {
			  moneyBet=inputMoney.nextInt();
		  }
		 else
		  {
			  System.out.println("Atleast enter a suitable amount you want to bet");
		  }
		 if (moneyBet>walletPlayer.check())
		  {
			  System.out.println("You don't have that much cash in your wallet");
		  }
		 if (walletPlayer.get(moneyBet))
		  {
			  for(int i=0; i< dice.length;i++)
			  {
				  dice[i]=new Dice();
				  rolls[i]=dice[i].roll();
			  }  
		  if (rolls[0]==rolls[1] && rolls[0]==rolls[2] && rolls[1]==rolls[2] && betPlaced.equals("triple"))
		     {
			  if (rolls[0]!=1 && rolls[0]!=6)
			  {
				  walletPlayer.put(31* moneyBet);
				  System.out.println("Lucky You. You won !");
				  System.out.println("The amount in your wallet now is" + walletPlayer.toString()); 
			  }
			  else
			  {
				  System.out.println("You lost !");
				  System.out.println("The amount in your wallet now is" + walletPlayer.toString());
			  }
		    }
		   else
		    {
			  int count= rolls[0] + rolls[1] + rolls[2];
			  if((count<8 || count >12) && betPlaced.equals("field"))
			  {
				 walletPlayer.put( 2* moneyBet); 
				 System.out.println("Lucky You. You won !");
				 System.out.println("The amount in your wallet now is" + walletPlayer.toString()); 
			  }
			  else if(count>10 &&  !(rolls[0]==rolls[1]&& rolls[1]==rolls[2] && rolls[0]>=4) && betPlaced.equals("high"))
			  {
				 walletPlayer.put( 2* moneyBet); 
				 System.out.println("Lucky You. You won !");
				 System.out.println("The amount in your wallet now is" + walletPlayer.toString()); 
			  }
			  else if(count<11 &&  !(rolls[0]==rolls[1]&& rolls[1]==rolls[2] && rolls[0]<=3) && betPlaced.equals("low"))
			  {
				 walletPlayer.put( 2* moneyBet); 
				 System.out.println("Lucky You. You won !");
				 System.out.println("The amount in your wallet now is" + walletPlayer.toString()); 
			  }
			  else
			  {
				  System.out.println("You lost !");
				  System.out.println("The amount in your wallet now is" + walletPlayer.toString());
			  }
		   }
	   }  
	}

}
