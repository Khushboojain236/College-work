
public abstract class ConnectPlayer {

	private int playerTurn;

	public int getPlayerturn(int playerTurn) {
		this.playerTurn = playerTurn;
		int player = playerTurn % 2 + 1;
		return player;
	}

	public abstract int getMove();

	public int getPlayerNumber() {
		// TODO Auto-generated method stub
		if (getPlayerturn(playerTurn) == 1) {
			return 1;
		}
		return 2;
	}
}
