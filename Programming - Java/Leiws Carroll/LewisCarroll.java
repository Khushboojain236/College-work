/* SELF ASSESSMENT 

1. readDictionary
- I have the correct method definition [Mark out of 5:]5
- Comment: correct method definition has been used
- My method reads the words from the "words.txt" file. [Mark out of 5:]5
- Comment: it reads words from the text file
- It returns the contents from "words.txt" in a String array or an ArrayList. [Mark out of 5:]4
- Comment: returns contents as an ArrayList

2. readWordList
- I have the correct method definition [Mark out of 5:]5
- Comment: correct method definition has been used
- My method reads the words provided (which are separated by commas, saves them to an array or ArrayList of String references and returns it. [Mark out of 5:]5
- Comment: saves them as an arrayList

3. isUniqueList
- I have the correct method definition [Mark out of 5:]5
- Comment:correct method definition has been used 
- My method compares each word in the array with the rest of the words in the list. [Mark out of 5:]4
- Comment: does compare
- Exits the loop when a non-unique word is found. [Mark out of 5:]5
- Comment: it does
- Returns true is all the words are unique and false otherwise. [Mark out of 5:]5
- Comment: returns true is all the words are unique

4. isEnglishWord
- I have the correct method definition [Mark out of 5:]5
- Comment: correct method definition has been used
- My method uses the binarySearch method in Arrays library class. [Mark out of 3:]3
- Comment: it does use it
- Returns true if the binarySearch method return a value >= 0, otherwise false is returned. [Mark out of 2:]2
- Comment: returns true if the value is>=0

5. isDifferentByOne
- I have the correct method definition [Mark out of 5:]5
- Comment:correct method definition has been used 
- My method loops through the length of a words comparing characters at the same position in both words searching for one difference. [Mark out of 10:]
- Comment: 

6. isWordChain
- I have the correct method definition [Mark out of 5:]5
- Comment: correct method definition has been used
- My method calls isUniqueList, isEnglishWord and isDifferentByOne methods and prints the appropriate message [Mark out of 10:]9
- Comment: it does calls the 3 methods and prints the appropriate message

7. main
- Reads all the words from file words.txt into an array or an ArrayList using the any of the Java.IO classes covered in lectures [Mark out of 10:]10
- Comment: it does
- Asks the user for input and calls isWordChain [Mark out of 5:]5
- Comment: asks user and calls the method

 Total Mark out of 100 (Add all the previous marks):97
*/


import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class LewisCarroll {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner input = new Scanner(System.in);
		ArrayList<String> dictionary = new ArrayList<String>();

		try {
			FileReader file = new FileReader("./src/words.txt");
			BufferedReader br = new BufferedReader(file);
			dictionary = readDictionary(br);
		} catch (Exception e) {
			System.out.println(e);
		}
		boolean finished = false;
		while (finished != true) {
			System.out.println("Enter a comma separated list of words (or an empty list to quit):");
			String words = input.nextLine();

			if (words.isEmpty()) {
				System.out.println("You quit!");
				finished = true;
			} else {
				ArrayList<String> wordList = readWordlist(words);
				if (isWordChain(wordList, dictionary)) {
					System.out.println("Valid chain of words from Lewis Carroll's word-links game.");
				}
				if (!isWordChain(wordList, dictionary)) {
					System.out.println("Not a valid chain of words from Lewis Carroll's word-links game.");
				}
			}
		}

	}

	public static ArrayList<String> readWordlist(String words) {
		// TODO Auto-generated method stub
		ArrayList<String> wordList = new ArrayList<String>();
		Scanner inputIs = new Scanner(words);
		inputIs.useDelimiter(",");

		while (inputIs.hasNext()) {
			wordList.add(inputIs.next());
		}
		return wordList;
	}

	public static ArrayList<String> readDictionary(BufferedReader br) {
		// TODO Auto-generated method stub
		ArrayList<String> dictionaryList = new ArrayList<String>();
		try {
			String nextWord = br.readLine();
			while (nextWord != null) {
				dictionaryList.add(nextWord);
				nextWord = br.readLine();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return dictionaryList;
	}

	public static boolean isUniqueList(ArrayList<String> wordList) {
		Set<String> set = new HashSet<String>(wordList);
		if (set.size() < wordList.size()) {
			return false;
		}
		return true;
	}

	public static boolean isEnglishWord(String word, ArrayList<String> dictionaryList) {
		String[] dictionaryArray = dictionaryList.toArray(new String[dictionaryList.size()]);
		if (Arrays.binarySearch(dictionaryArray, word) >= 0) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isDifferentByOne(String firstWord, String secondWord) {
		if (firstWord.length() == secondWord.length()) {
			boolean oneDifference = false;
			for (int i = 0; i < firstWord.length(); i++) {
				if (firstWord.charAt(i) != secondWord.charAt(i)) {
					if (oneDifference) {
						return false;
					} else {
						oneDifference = true;
					}
				}
			}
			return true;
		}
		return false;
	}

	public static boolean isWordChain(ArrayList<String> wordList, ArrayList<String> dictionary) {
		// TODO Auto-generated method stub
		if (isUniqueList(wordList)) {
			for (int i = 0; i < wordList.size() - 1; i++) {
				if (isEnglishWord(wordList.get(i), dictionary) && isEnglishWord(wordList.get(i + 1), dictionary)) {
					if (!isDifferentByOne(wordList.get(i), wordList.get(i + 1)))
						return false;
				} else {
					return false;
				}
			}
		} else {
			return false;
		}
		return true;
	}
}