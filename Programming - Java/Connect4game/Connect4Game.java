
/* SELF ASSESSMENT

Connect4Game class (35 marks): 33
My class creates references to the Connect 4 Grid and two Connect 4 Players. 
It asks the user whether he/she would like to play/quit inside a loop. 
If the user decides to play then: 1. Connect4Grid2DArray is created using the Connect4Grid interface,
2. the two players are initialized - must specify the type to be ConnectPlayer, and
3. the game starts. In the game, I ask the user where he/she would like to drop the piece.
I perform checks by calling methods in the Connect4Grid interface. Finally a check is performed to determine a win. 
Comment:the class does create references and it also does the following

Connect4Grid interface (10 marks):10
I define all 7 methods within this interface.
Comment:All 7 methods are defined

Connect4Grid2DArray class (25 marks) 
My class implements the Connect4Grid interface.:23
It creates a grid using a 2D array Implementation of the method to check whether the column to drop the piece is valid.
It provides as implementation of the method to check whether the column to drop the piece is full. 
It provides as implementation of the method to drop the piece. 
It provides as implementation of the method to check whether there is a win.
Comment:It does the above

ConnectPlayer abstract class (10 marks):10
My class provides at lest one non-abstract method and at least one abstract method. 
Comment:Getmove() is the abstract method and getPlayerNumber() and getPlayerTurn() are non-abstract methods

C4HumanPlayer class (10 marks):10
My class extends the ConnectPlayer class and overrides the abstract method(s). It provides the Human player functionality.
Comment:It does overrides the abstract method and provides human player functionality

C4RandomAIPlayer class (10 marks):10
My class extends the ConnectPlayer class and overrides the abstract method(s). It provides AI player functionality. 
Comment:It does overrides the abstract method and provides AI player functionality

Total Marks out of 100:96

*/

import java.util.Scanner;

public class Connect4Game {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner input = new Scanner(System.in);
		boolean finished = false;
		boolean repeat = false;
		boolean notQuit = false;
		ConnectPlayer Player1 = null;
		ConnectPlayer Player2 = null;
		boolean doAll = false;
		while (doAll == false) {
			System.out.println("Welcome to Connect 4!");
			while (repeat != true) {
				System.out.print("Please select a player for Player 1(Human/Computer) (or 'quit' to quit) : ");
				String userInput = input.next();
				if (userInput.equalsIgnoreCase("quit")) {
					doAll = true;
					repeat = true;
					finished = true;
					notQuit = true;
				} else if (userInput.equalsIgnoreCase("human")) {
					repeat = true;
					finished = false;
					notQuit = false;
					Player1 = new C4HumanPlayer();
				} else if (userInput.equalsIgnoreCase("computer")) {
					repeat = true;
					finished = false;
					notQuit = false;
					Player1 = new C4RandomAIPlayer();
				} else {
					System.out.println("Enter a valid input");
					repeat = false;
					notQuit = true;
				}
				while (notQuit == false) {
					System.out.print("Please select a player for Player 2(Human/Computer) (or 'quit' to quit) : ");
					String userInput2 = input.next();
					if (userInput2.equalsIgnoreCase("quit")) {
						doAll = true;
						repeat = true;
						finished = true;
						notQuit = true;
					}

					else if (userInput2.equalsIgnoreCase("human")) {
						Player2 = new C4HumanPlayer();
						notQuit = true;
						finished = false;
						repeat = true;

					} else if (userInput2.equalsIgnoreCase("computer")) {
						Player2 = new C4RandomAIPlayer();
						repeat = true;
						finished = false;
						notQuit = true;

					} else {
						System.out.println("Enter a valid input");
						finished = false;
						notQuit = false;

					}
				}
			}
			int playerTurn = 0;
			while (finished == false) {
				finished = true;
				Connect4Grid2DArray obj = new Connect4Grid2DArray();
				obj.emptyGrid();
				boolean won = false;
				while (won == false) {

					if (Player1.getPlayerturn(playerTurn) == 1) {
						playerTurn++;
						won = false;
						boolean validInput = false;
						System.out.print(" It's Player 1 (R)'s turn ! Select a column (1-7): ");
						while (validInput == false) {
							int columnPlayer1 = Player1.getMove();
							if (obj.isValidColumn(columnPlayer1)) {
								if (obj.isGridFull() != true) {
									if (obj.isColumnFull(columnPlayer1) == true) {
										obj.dropPiece(Player1, columnPlayer1);
										obj.toString();
										if (obj.didLastPieceConnect4() == true) {
											System.out.println("Player 1 won");
											validInput = true;
											won = true;
											repeat = false;
											finished = true;
											doAll = false;

										}
										validInput = true;
									}

									else {
										System.out.println("The column is full");
										System.out.print("Try another column (1-7): ");
										validInput = false;
									}
								} else {
									System.out.println("Grid is full");
									validInput = true;
									won = true;
									repeat = false;
									finished = true;
									doAll = false;
								}
							}

							else {
								System.out.println("The column number entered is not valid ");
								System.out.print("Enter a valid column number (1-7):");
								validInput = false;
							}

						}
					}
					if (Player2.getPlayerturn(playerTurn) == 2) {
						playerTurn++;
						won = false;
						boolean validInput2 = false;
						System.out.print(" It's Player 2 (Y)'s turn ! Select a column (1-7): ");

						while (validInput2 == false) {

							int columnPlayer2 = Player2.getMove();
							if (obj.isValidColumn(columnPlayer2)) {
								if (obj.isGridFull() != true) {
									if (obj.isColumnFull(columnPlayer2)) {
										obj.dropPiece(Player2, columnPlayer2);
										obj.toString();
										if (obj.didLastPieceConnect4() == true) {
											System.out.println("Player 2 won");
											validInput2 = true;
											won = true;
											repeat = false;
											finished = true;
											doAll = false;
										}
										validInput2 = true;
									} else {
										System.out.println("The column is full");
										System.out.print("Try another column (1-7): ");
										validInput2 = false;
									}
								} else {
									System.out.println("Grid is full");
									validInput2 = true;
									won = true;
									repeat = false;
									finished = true;
									doAll = false;

								}
							} else {
								System.out.println("The column number entered is not valid ");
								System.out.print("Enter a valid column number (1-7):");
								validInput2 = false;
							}

						}
					}
				}
			}
		}
	}
}
