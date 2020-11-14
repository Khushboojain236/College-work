
public class Connect4Grid2DArray implements Connect4Grid {

	public static char[][] board;

	public void emptyGrid() {
		board = new char[ROWS][COLUMNS];
		for (int row = 0; row < board.length; row++) {
			java.util.Arrays.fill(board[row], 0, board[row].length, '-');
		}
		toDisplay(board);
	}

	private void toDisplay(char[][] board) {
		// TODO Auto-generated method stub
		System.out.println();
		for (int row = 0; row < board.length; row++) {
			System.out.print("|");
			for (int col = 0; col < board[row].length; col++) {
				System.out.print(" " + board[row][col] + " |");
			}
			System.out.println();
		}

	}

	public boolean isValidColumn(int column) {
		// TODO Auto-generated method stub
		if (column < 1 || column > COLUMNS) {
			return false;
		} else {
			return true;
		}
	}

	public boolean isColumnFull(int column) {
		// TODO Auto-generated method stub
		if (board[0][column - 1] != '-') {
			return false;
		}
		return true;
	}

	public void dropPiece(ConnectPlayer player, int column) {
		// TODO Auto-generated method stub
		if (player.getPlayerNumber() == 1) {
			for (int row = ROWS - 1; row >= 0; row--) {
				if (board[row][column - 1] == '-') {
					board[row][column - 1] = 'R';
					break;
				}
			}
		}
		if (player.getPlayerNumber() == 2) {
			for (int row = ROWS - 1; row >= 0; row--) {
				if (board[row][column - 1] == '-') {
					board[row][column - 1] = 'Y';
					break;
				}
			}
		}
	}

	public boolean didLastPieceConnect4() {
		// TODO Auto-generated method stub
		// Check horizontally
		for (int row = 0; row < board.length; row++) {
			for (int col = 0; col < board[row].length - 3; col++) {
				if (board[row][col] != '-' && board[row][col] == board[row][col + 1]
						&& board[row][col] == board[row][col + 2] && board[row][col] == board[row][col + 3]) {
					return true;
				}
			}
		}
		// Check vertically
		for (int col = 0; col < board[0].length; col++) {
			for (int row = 0; row < board.length - 3; row++) {
				if (board[row][col] != '-' && board[row][col] == board[row + 1][col]
						&& board[row][col] == board[row + 2][col] && board[row][col] == board[row + 3][col]) {
					return true;
				}
			}
		}
		// Check diagonally, from top left
		for (int row = 0; row < board.length - 3; row++) {
			for (int col = 0; col < board[row].length - 3; col++) {
				if (board[row][col] != '-' && board[row][col] == board[row + 1][col + 1]
						&& board[row][col] == board[row + 2][col + 2] && board[row][col] == board[row + 3][col + 3]) {
					return true;
				}
			}
		}
		// Check diagonally, from top right
		for (int row = 0; row < board.length - 3; row++) {
			for (int col = 3; col < board[row].length; col++) {
				if (board[row][col] != '-' && board[row][col] == board[row + 1][col - 1]
						&& board[row][col] == board[row + 2][col - 2] && board[row][col] == board[row + 3][col - 3]) {
					return true;
				}
			}
		}

		return false;
	}

	public boolean isGridFull() {
		// TODO Auto-generated method stub
		int count = 0;
		for (int row = 0; row < board.length; row++)
			for (int col = 0; col < board[row].length; col++) {
				if (board[row][col] != '-') {
					count++;
				}
			}
		if (count >= 42) {
			return true;
		}
		return false;
	}

	public String toString() {
		toDisplay(board);
		return null;

	}

}
