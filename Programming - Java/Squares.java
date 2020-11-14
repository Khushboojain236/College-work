package squares;

import java.util.Scanner;

public class Squares {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 Scanner input =new Scanner (System.in);
		    System.out.print("Enter a number to display the numbers whose squares are less than or equal to it:  ");
		    int limitNumber = input.nextInt() ;
		    int maxn=(int) Math.sqrt(limitNumber);
		    
		    input.close();
		    
		    if ( limitNumber< 0 )
		    {
		    	System.out.print("Enter a valid number");
		    }
		    
		    else
		    {
		    	System.out.print("The number whose squares are less than or equal to the" + limitNumber +"are" );
		    	for ( int result= 0; (result <= maxn) ; result++)
		    	{
		    		 
		    		
		    		System.out.print(( (result > 0)? "," : " ")   + result );
		    		
		    	}
		    		
		    	}
	}

}
