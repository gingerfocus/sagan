public class ValueWrapper implements Comparable<ValueWrapper> {

	public String word;
	public int position;

	//wraper class so that hash map can be passed word and number as value
	public ValueWrapper(String word, int position) {
		this.word = word;
		this.position = position;
	}

	String getWord() {return word;}
	int getPosition () {return position;}

	void setWord (String word) {this.word = word;}
	void setPosition (int position) {this.position = position;}


	@Override public int compareTo (ValueWrapper other) {
		return other.getWord().compareTo(word);
	}
}
