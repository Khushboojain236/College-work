import java.util.Scanner;

public class swap {
	 

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int t;
		Scanner input = new Scanner(System.in);

        System.out.print("Enter first number: ");
        int x = input.nextInt(); 

        System.out.print("Enter second number: ");
        int y = input.nextInt(); 

        t = x + y; 
        y = t - y; 
        x = t - x; 

        System.out.println("After swaping:" + " x = " + x + ", y = " + y); 
    } 

}

