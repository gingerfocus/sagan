import java.util.List;
import java.util.ArrayList;

public class AnagramList
{
    //instance variables
    private List<Word> wordList;
    
    //constructor
    public AnagramList()
    {
        wordList = new ArrayList<Word>();
    }
    
    //other methods
    
    /** Adds a Word, whose original order is 
     *  newWord, to wordList.
     */
    public void addWord(Word newWord)
    {
        wordList.add(newWord);
    }
    
    /** Returns true if aWord and another Word have original
     *          strings that are anagrams (words composed of 
     *          the same letter), otherwise returns false.
     */
    public boolean checkAnagram(Word aWord, Word anotherWord)
    {
        if (aWord.getSortedWord().equals(anotherWord.getSortedWord()))
            return true;
        else
            return false;
    }
    
    /** Prints  the original words of all Words in wordList that
     *          are anagrams of the String key
     */
    public void printAnagrams(String key)
    {
        Word keyWord = new Word (key);
        for (Word checking : wordList)
            if (checkAnagram (checking, keyWord))
                System.out.println(checking);
    }
}