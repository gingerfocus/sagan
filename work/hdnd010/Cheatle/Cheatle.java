import java.util.*;
import java.io.File;

public class Cheatle {

	public HashMap<Character, TreeSet> notInWord;
	public HashMap<Character, TreeSet> inWord;

	public TreeSet<String> guesses;
	public TreeSet<String> answers;

	public TreeSet<Character> alphabetTree;

	public final int wordLength;

	public TreeSet<String> answersLeft;

	public TreeSet<Character> correctLetters;
	public TreeSet<Character> wrongPlaceLetters;
	public TreeSet<Character> wrongLetters;
	public TreeSet<Character> unguessedLetters;

	public int guessesMade;

	//does the constructor stuff, throws a BadDictionaryException if file passed is bad
	public Cheatle(String dictionaryFile, String solutionFile) throws BadDictionaryException {
	
		alphabetTree = new TreeSet<Character>();

		String wordAdded = "";
		Character singleLetter = (Character)'a';

		this.guesses = new TreeSet<String>();
		this.answers = new TreeSet<String>();

		this.correctLetters = new TreeSet<Character>();
		this.wrongPlaceLetters = new TreeSet<Character>();
		this.wrongLetters = new TreeSet<Character>();


		//reading guesses file

		File dictFile = new File(dictionaryFile);
		Scanner dictInput = null;
		try { dictInput = new Scanner(dictFile); }
		catch (Exception e1) { System.exit(1); } 

		while (dictInput.hasNext()) {
			wordAdded = dictInput.next();
			guesses.add(wordAdded);

			for (int i = 0; i < wordAdded.length(); i++) {
				singleLetter = (Character)wordAdded.charAt(i);
				alphabetTree.add(singleLetter); //should only add if not present
			}
		}
		dictInput.close();

		//reading answers file (also added to to the guesses tree)

		File soluFile = new File(solutionFile);
		Scanner solutionInput = null;
		try { solutionInput = new Scanner(solutionFile); }
		catch (Exception e2) { System.exit(1); } //joe

		while (solutionInput.hasNext()) {
			wordAdded = solutionInput.next();
			guesses.add(wordAdded);
			answers.add(wordAdded);

			for (int i = 0; i < wordAdded.length(); i++) {
				singleLetter = (Character)wordAdded.charAt(i);
				alphabetTree.add(singleLetter); //should only add if not present
			}
		}	

		//now the alphabet should be fully initailized
		//so now we do all of the advaserial code
		
		wordLength = guesses.pollFirst().length();

		notInWord = new HashMap<Character, TreeSet>();
		inWord = new HashMap<Character, TreeSet>();

		for (String word : guesses) {
			//for each word
			
			if (word.length() != wordLength) { throw new BadDictionaryException(); }

			for (int i = 0; i < word.length(); i++) {
				//for each letter

				for (Character letter : alphabetTree) {
					//for each possible letter

					Character curLetter = (Character)word.charAt(i);
					
					if (word.contains(letter.toString())) { //leter is in the word: this may not word Character class

						TreeSet newTree = inWord.get(letter);
						if (newTree != null) { //if there is already a tree there
							//System.out.println("Test6");
							newTree.add(word);
							inWord.replace(letter, newTree);
						} else { //make the tree and add it
							//System.out.println("Test7");
							newTree = new TreeSet<String>();
							newTree.add(word);
							inWord.put(letter, newTree);
						}

					} else { //letter is not in the word

						//System.out.println("Failu 30");

						TreeSet tree = notInWord.get(letter);
						if (tree != null) {
							tree.add(word);
							notInWord.replace(letter, tree);
						} else {
							tree = new TreeSet<String>();
							tree.add(word);
							notInWord.put(letter, tree);
							//System.out.println("Test7"); //this calls 26 times so it is working
						}
					}
				}
			}
		}

		//now all the hash maps are done
	} //FAILING
	//NOTE HASH MAPS MAY NOT BE BEING CREATED PROPERLY

	public int getWordLength() {
		//returns the length of all the words in the list
		//they should all be the same if the constructer ran correctly
		return wordLength;
	} //done!
	public String getAlphabet() {
		//returns the alphabet of all letters that could be in words
		String retAlph = "";
		for (Character letter : alphabetTree) {
			retAlph += letter.toString();
		}
		return retAlph;
	} //done!
	public void beginGame() {
		//begins the game by initializing all the data structures to what they should be 
		//this meathod call is a prerquisit to the game functioning properly
		//sneaky comment: ^ this shouldnt be a thing ^ but Mr. Chein loves inefficency
		answersLeft = (TreeSet)answers.clone();
		unguessedLetters = (TreeSet)alphabetTree.clone();
		guessesMade = 0;
	} //done!
	public boolean isAllowable(String guess) {
		//returns a boolean for if a given guess is allowable
		//checks all possible words not just the remaining ones
		return guesses.contains(guess);
	} //done!

	public String makeGuess(String guess) {
		/**
		 * returns a string of *, ? and ! given an input
		 * means that the letter is not in the word, ? is that it is and ! is that it is in that place
		 * returns the guess the maximises the number of possibilities left for the user
		 * also makes sure to update various data structures for user convinence
		 * see (some) meathods bellow for examples of said data structures
		*/

		if (isAllowable(guess)) {
			TreeSet<String> allFeedback = new TreeSet<String>();
			for (String wordy : answersLeft) {
				String feedback = generateFeedback(guess, wordy);
				allFeedback.add(feedback); //should only add unique ones
			} 

			TreeSet tempBest = new TreeSet();

			String currentFeedback = allFeedback.pollFirst();
			int largestPossibleLeft = 0;

			for (String curFeedback : allFeedback) {
				//for each response

				System.out.println(curFeedback);

				TreeSet<String> uncutWords = (TreeSet)answersLeft.clone();

				for (int i = 0; i < curFeedback.length(); i++) {
					//for each letter of that response

					Char curFeedbackLetter = curFeedback.charAt(i);

					if (curFeedbackLetter.equals("!")) {
						uncutWords = overlapedTreeCorrect(uncutWords, inWord.get((Character)guess.charAt(i)), i, guess.charAt(i)); //this wont work bc position still amaters
					} else if (curFeedbackLetter.equals("?")) {
						uncutWords = overlapedTree(uncutWords, inWord.get((Character)guess.charAt(i)) );
					} else if (curFeedbackLetter.equals("*")) {
						uncutWords = overlapedTree(uncutWords, notInWord.get((Character)guess.charAt(i)) );
					}
				}

				if (uncutWords.size() > largestPossibleLeft) {
						tempBest = (TreeSet)uncutWords.clone();
						largestPossibleLeft = uncutWords.size();
						currentFeedback = curFeedback;
				}
			}

			answersLeft = (TreeSet)tempBest.clone();			
			updateFeedback(currentFeedback, guess);
			return currentFeedback;
		} else {
			return "you did the bad input stuff";
		}
	} //FAIL

	private TreeSet overlapedTreeCorrect (TreeSet tree1, TreeSet treeCorrect, int pos, char letter) {
		TreeSet retTree = (TreeSet)tree1.clone();
		for (String wordy : tree1) {
			if (!treeCorrect.contains(wordy)) {
				retTree.remove(wordy);
			}
		}
	}

	private void updateFeedback (String feedback, String userGuess) {
		//given a feed back of *, ? and ! updates data structures to reflec users known info
		//uses the letters of their guesses as well

		for (int i = 0; i < feedback.length(); i++) {
				if (feedback.charAt(i) == '!') {
					correctLetters.add((Character)userGuess.charAt(i));
					wrongPlaceLetters.remove((Character)userGuess.charAt(i));
					wrongLetters.remove((Character)userGuess.charAt(i));
				} else if (feedback.charAt(i) == '?') {
					wrongPlaceLetters.add((Character)userGuess.charAt(i));
					wrongLetters.remove((Character)userGuess.charAt(i));
				} else {
					wrongLetters.add((Character)userGuess.charAt(i));
				}

				unguessedLetters.remove((Character)userGuess.charAt(i));
			}
			guessesMade++;
	} //done?

	private TreeSet overlapedTree (TreeSet tree1, TreeSet tree2) {
		//takes in 2 treeSets and returns a tree the contains only values that are in both
		if (tree1.isEmpty()) {
			return tree2;
		} else {
			TreeSet retTree = (TreeSet)tree1.clone();
			for (Object thing : tree1) {
				if (!tree2.contains(thing)) {
					retTree.remove(thing);
				}
			}
			return retTree;
		}
	} //done? - some iffy stuff with nulls going on but i dont think this is the problem


	private String generateFeedback(String guess, String answer) {
		//given a guess and and answer of the same length, returns a string of *!? the properly reflects how they overlap

		//this meathod doesnt need to check for bad input beacuse it should only be called in safe situations
		String feedback = "";
		String mutableAnswer = answer;

		//try removing the letter after you add a ! feedback

		for (int i = 0; i < answer.length(); i++) {
			if (answer.substring(i, i+1).equals(guess.substring(i, i+1))) {
				feedback += "!";
				mutableAnswer = mutableAnswer.substring(0, mutableAnswer.indexOf(answer.substring(i, i+1))) + mutableAnswer.substring(mutableAnswer.indexOf(answer.substring(i, i+1)) + 1, mutableAnswer.length());
			} else {
				feedback += "*";
			}
		}

		for (int i = 0; i < answer.length(); i++) {
			if (feedback.substring(i, i+1).equals("*") && mutableAnswer.contains(guess.substring(i, i+1))) {
				feedback = feedback.substring(0, i) + "?" + feedback.substring(i+1, feedback.length());
				mutableAnswer = mutableAnswer.substring(0, mutableAnswer.indexOf(answer.substring(i, i+1))) + mutableAnswer.substring(mutableAnswer.indexOf(answer.substring(i, i+1)) + 1, mutableAnswer.length());
			}
		}

		return feedback;
	} //done! - tested well
	public String correctPlaceLetters() {
		//Returns a String of all letters that have received a ! feedback
		String retStr = "";
		for (Character letter : correctLetters) {
			retStr += letter.toString();
		}
		return retStr;
	} //done!
	public String wrongPlaceLetters() {
		//Returns a String of all letters that have received a ? feedback
		String retStr = "";
		for (Character letter : wrongPlaceLetters) {
			retStr += letter.toString();
		}
		return retStr;
	} //done!
	public String eliminatedLetters() {
		//Returns a String of all letters that have received a * feedback
		String retStr = "";
		for (Character letter : wrongLetters) {
			retStr += letter.toString();
		}
		return retStr;
	} //done!
	public String unguessedLetters() {
		//Returns a String of all unguessed letters
		String retStr = "";
		for (Character letter : unguessedLetters) {
			retStr += letter.toString();
		}
		return retStr;
	} //done!
	public boolean isWinningFeedback(String feedback) {
		//retruns trues if the input is all !!!!!!!

		for (int i = 0; i < this.getWordLength(); i++) {
			if (!feedback.substring(i, i+1).equals("!")) {
				return false;
			}
		}
		return true;
	} //done!
	public String getWordsRemaining() {
		//Returns a String of all the remaining possible words, with one word per line
		String retStr = "";
		for (String word : answersLeft) {
			retStr += word + "\n";
		}
		return retStr;
	} //done? - need to check desired syntax of tester
	public int getNumRemaining() {
		//Returns the number of possible words remaining
		return answersLeft.size();
	} //done!
	public int numberOfGuessesMade() {
		//Returns the number of guesses made in this game
		return guessesMade;
	} //done!
	public void restart() {
		//Ends the current game and starts a new game by resting data structures
		correctLetters = new TreeSet<Character>();
		wrongPlaceLetters = new TreeSet<Character>();
		wrongLetters = new TreeSet<Character>();
		beginGame();
	} //done!

//_____________________________________________________________________________________________________________________

/*
	public static void main (String [] args) {
		Cheatle donCheatle = null;
		try {
			donCheatle = new Cheatle("WordleDictionary.txt", "WordleSolutionList.txt");
		} catch (Exception e) {System.exit(1);}

		donCheatle.beginGame();

		//System.out.println(donCheatle.getAlphabet());
		//System.out.println(donCheatle.getWordsRemaining());

		//System.out.println(donCheatle.generateFeedback("stare",  "brare"));
	}
*/
}




















