import java.util.Scanner;

public class C4HumanPlayer extends ConnectPlayer {

	@Override
	public int getMove() {
		// TODO Auto-generated method stub
		Scanner input = new Scanner(System.in);
		int column = input.nextInt();
		return column;

	}

}
