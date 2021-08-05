
import java.lang.Math;
import java.util.Random;
import java.util.Scanner;

public class vernamCipher {
	private static String CHAR_LIST = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

	public static String generateRandomString(int length) {
		int number;
		char ch;
		Random generator = new Random();
		StringBuffer randStr = new StringBuffer();

		for (int i = 0; i < length; i++) {
			number = generator.nextInt(CHAR_LIST.length());
			ch = CHAR_LIST.charAt(number);
			randStr.append(ch);
		}
		return randStr.toString();
	}

	public static void main(String args[]) {
		System.out.print("Input string to be encrypted: ");
		Scanner input = new Scanner(System.in);
		String p = input.next();
		char[] plainText = p.toCharArray();

		String k = generateRandomString(p.length());
		char[] key = k.toCharArray();

		char[] cipherText = new char[p.length()];

		System.out.print("Encoded " + p + " to be... ");
		for (int i = 0; i < plainText.length; i++) {
			cipherText[i] = (char) (plainText[i] ^ key[i]);
			System.out.print(cipherText[i]);
		}

		System.out.print("\nDecoded ");
		System.out.print(cipherText);
		System.out.print(" to be... ");

		for (int i = 0; i < cipherText.length; i++) {
			char temp = (char) (cipherText[i] ^ key[i]);
			System.out.print(temp);
		}
		System.out.println("");
	}

}