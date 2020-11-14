
public interface Connect4Grid {

	public static final int ROWS = 6;
	public static final int COLUMNS = 7;

	public abstract void emptyGrid();

	public abstract String toString();

	public abstract boolean isValidColumn(int column);

	public abstract boolean isColumnFull(int column);

	public abstract void dropPiece(ConnectPlayer player, int column);

	public abstract boolean didLastPieceConnect4();

	public abstract boolean isGridFull();
}
