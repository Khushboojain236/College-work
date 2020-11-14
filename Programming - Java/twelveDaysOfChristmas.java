/* SELF ASSESSMENT
 1. Did I use easy-to-understand meaningful, properly formatted, variable names and CONSTANTS?
        Mark out of 10:10
        Comment: constant and variable names are apt and in proper format
 2. Did I implement the getVerse function correctly and in a manner that can be understood (5 marks for function definition, 5 marks for function call and 15 marks for function implementation)?
       Mark out of 25:23
        Comment:  Proper function definition, call and functionality has been done  
 3. Did I implement the getChristmasGift function correctly using a switch statement and in a manner that can be understood (5 marks for function definition, 5 marks for function call and 15 marks for function implementation)?
       Mark out of 25:24
        Comment:switch statement has been used and with proper definition , call and functionality    
 4. Did I implement the getOrdinalString function correctly using if or conditional operators and in a manner that can be understood (5 marks for function definition, 5 marks for function call and 15 marks for function implementation)?
       Mark out of 25:24
        Comment:  uses conditional operators and with proper definition, call and functionality  of returning ordinal string 
 5. Does the program produce the output correctly?
       Mark out of 10:9
        Comment:  program produces the output correctly in the given form
 6. How well did I complete this self-assessment?
        Mark out of 5:5
        Comment: has been fairly assessed
 Total Mark out of 100 (Add all the previous marks):95
*/ 
package twelveDaysOfChristmas;

public class twelveDaysOfChristmas {
    public static final int NUM_OF_VERSES=12;
    
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	   int verseNum=1;   
	   for( verseNum=1 ;verseNum<=NUM_OF_VERSES; verseNum++)
	   {
		   System.out.print(getVerse(verseNum));
				
		}
	}
	public static String getOrdinalString(int verseNum) {
		// TODO Auto-generated method stub
		   String dayOrdinal=" ";
		   if (verseNum== 1)
		   {
				 dayOrdinal="first ";
		   }
		   else if (verseNum==2) 
		   {
			    dayOrdinal="second ";
		   }
		   else if (verseNum==3) 
		   {
			    dayOrdinal="third  ";
		   }
		   else if (verseNum==4) 
		   {
			    dayOrdinal="fourth ";
		   }    
		   else if (verseNum==5) 
		   {
			    dayOrdinal="fifth ";
		   }
		   else if (verseNum==6) 
		   {
			    dayOrdinal="sixth ";
		   }
		   else if (verseNum==7) 
		   {
			    dayOrdinal="seventh ";
		   }
		   else if (verseNum==8) 
		   {
			    dayOrdinal="eighth ";
		   }
		   else if (verseNum==9)
		   {
			    dayOrdinal="ninth ";
		   }
		   else if (verseNum==10) 
		   {
			    dayOrdinal="tenth ";
		   }
		   else if (verseNum==11) 
		   {
			    dayOrdinal="eleventh ";
		   }
		   else
		   {
			    dayOrdinal="twelfth ";
           }   
		return dayOrdinal;
	}
	  
	public static String getChristmasGift(int currentGiftNum) {
		// TODO Auto-generated method stub
		   String gift =" ";
		   switch(currentGiftNum) 
		   {
		    case 12:
			  gift="twelve Drummers Drumming,\n";
			  break;
			case 11:
			  gift="eleven Pipers Piping,\n";
			  break;
			case 10:
			  gift="ten Lords a Leaping,\n";
			  break;
			case 9:
			  gift="nine Ladies Dancing,\n";
			  break;
			case 8:
			  gift="eight Maids a Milking,\n";	
			  break;
			case 7:
			  gift="seven Swans a Swimming,\n"; 
			  break;
		    case 6:
			  gift="six Geese a Laying,\n";
			  break;
			case 5:
			  gift="five Gold Rings,\n";
			  break;
			case 4:
			  gift="four Calling Birds,\n";
			  break;
			case 3:
			  gift="three French Hens,\n" ;
			  break;
			case 2:
			  gift="two Turtle Doves\nand ";
			  break;
			case 1:
			  gift="a Patridge in a Pear Tree\n";;
			  break;
			 default:
		   }
		return gift ;
	}
	
    public static String getVerse(int verseNum) {
	// TODO Auto-generated method stub
	   int currentGiftNum=1;
	   String verse="";
	   String line="";
	   for (currentGiftNum=1; currentGiftNum<=verseNum; currentGiftNum++)
	   {
		    line=getChristmasGift(currentGiftNum)+line;   
	   }
	   verse="On the "+getOrdinalString(verseNum)+ "day of Christmas\n" +"my true love sent to me:\n"+line ;
	   return verse;
    }
}