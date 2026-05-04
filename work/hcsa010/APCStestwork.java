//---------------------------------------------------------------------------------------------------
//Question 1:


public class ConcealedWord {
	private final String word;

	public concealedWord (String word){
		this.word = word;
	}
	
	public void getClue (String guess){
		for (int i = 0; i < guess.length(); i++) {
			if (guess.charAt(i) == word.charAt(i))
				System.out.print(guess.charAt(i));
			else if (word.contains(guess.charAt(i))
				System.out.print("*"));
			else	
				System.out.print("?");
		}	
		System.out.println();
	}
}

//---------------------------------------------------------------------------------------------------
//Question 2:


public class Location{

	public Location (int r, int c) {/* constructs things */}

	public static Location findLocation (char input, char[][] arr) {
		for (int r = 0; r < arr.length; r++) {
			for (int c = 0; c < arr[r].length; c++) {
				if (arr[r][c] == input) {
					Location node = new Location(r, c);
					return node;
				}				
			}
		}
		return null;
	}

	public static Location[][] getNextLetter (char[][] arr) {
		Location[][] output = new Location[arr.length][arr[0].length];
		for (int r = 0; r < arr.length; r++) {
			for (int c = 0; c < arr[r].length; c++) {
				output[r][c] = findLocation(arr[r][c] + 1, arr); //works bc ascii
			}
		}
		return output;
	}	
}


//---------------------------------------------------------------------------------------------------
//Question 3:

public interface mailbox {
	String getOwner();
	int getNumber();
}

public class MailBox implements mailbox {
	//constructs MailBox objects
	//implements mailbox correctly
}

public class mailBoxGroup {

	//assumed to be filled
	private MailBox[] spaces;

	public int findMailBoxSpace (String owner) {
		for (int i = 0; i < spaces.length; i++)
			if (spaces[i].getOwner().equals(owner))
				return i;
		return -1;
	}

	public void consolidate() {
		//creating new correct array
		MailBox[] noNull = new MailBox[spaces.length];
		
		int indexOfBox = 0;
		for (int i = 0; i < spaces.length; i++) {
			if (spaces[i] != null) {
				noNull[indexOfBox] = spaces[i];
				indexOfBox++;
			}			
		}

		//copying it to main array
		for (int i = 0; i < noNull.length; i++) {
			if (noNull[i] != null)
				spaces[i] = noNull[i];
			else 
				spaces[i] = null;
		}	
	}
}

//---------------------------------------------------------------------------------------------------