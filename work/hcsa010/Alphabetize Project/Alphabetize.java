import java.util.ArrayList;
import java.util.Collections;
import static java.lang.System.*;

public class Alphabetize
{
    //instance variables
    private ArrayList<String> list;

    //constructors
    
    public Alphabetize()
    {
        list = new ArrayList<String>();
    }

    //other methods
    
    /** adds word to list so that list remains alphabetized */
    public void add (String  word)
    {
        int insertLocation = findInsertLocation(word);
        if (insertLocation >= 0)
            list.add(insertLocation, word);
    }

    /** returns the location in list where word would go to keep the list alphabetized */
    private int findInsertLocation( String word )
    {
        int arrSize = list.size();
        int lowerBound = 0;
        int upperBound = arrSize;
        
        while (upperBound - lowerBound > 1) {
            if (list.get((lowerBound + upperBound) / 2).compareTo(word) < 0){
                upperBound = (lowerBound + upperBound / 2);
            } else if (list.get(lowerBound + upperBound / 2).compareTo(word) > 0) {
                lowerBound = (lowerBound + upperBound / 2);
            } else {
                return -1;
            }
        }
        return lowerBound;
    }
    
    /** removes word from list and keeps list alphabetized */
    public void remove(String word)
    {
        
    }

    /** returns a String containing all of the words in list */
    public String toString()
    {
        return list.toString();
    }
    
    public ArrayList<Integer> merge (ArrayList<Integer> arr1, ArrayList<Integer> arr2) {
        ArrayList<Integer> combinedArray = new ArrayList<Integer>();
        if (arr1.get(0) < arr2.get(0))
            for (int i = 0; i < arr1.size(); i++)
                combinedArray.add(arr1.get(i));
        
        int indexTested = 0;
        for (int i = 0; i < arr2.size(); i++) {
            for (int j = indexTested; j < arr1.size(); j++) {
                if (arr1.get(j) < arr2.get(i))
                    indexTested++;
                else
                    combinedArray.add(j, arr2.get(i));
            }
        }
        return combinedArray;
    }
}
