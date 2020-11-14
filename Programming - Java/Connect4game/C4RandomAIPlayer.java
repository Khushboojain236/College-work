import java.util.Random;

public class C4RandomAIPlayer extends ConnectPlayer {

	@Override
	public int getMove() {
		// TODO Auto-generated method stub
		Random generator = new Random();
		int computerChoosen = generator.nextInt(7) + 1;
		System.out.println(computerChoosen);
		return computerChoosen;
	}

}
