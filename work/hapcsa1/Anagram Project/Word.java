public class Word
{
    //instance variables
    private String originalWord;
    private String sortedWord;

    //constructor
    public Word(String theWord)
    {
        originalWord = theWord.toLowerCase();
        sortedWord = this.sortWord();
    }

    //setters and getters
    /** Write the getters for each of the instance variables
     *  below
     */
    public String getOriginalWord () {return originalWord;}
    public String getSortedWord () {return sortedWord;}
    public void setOriginalWord (String newWord) {
        originalWord = newWord;
        sortedWord = this.sortWord();
    }

    //other methods
    /** Returns the sorted version of the orignalWord
     *          Example:  if origninalWord = "apple",
     *          "aelpp" is returned
     */
    private String sortWord()
    {
        //creates and fills and array that is the word but as an array of chars
        char[] wordLetters = new char[originalWord.length()];
        for (int i = 0; i < originalWord.length(); i++)
            wordLetters[i] = originalWord.charAt(i);

        //creates an array to hold the sorted word then fills it
        char[] returnedLetters = new char[wordLetters.length];
        returnedLetters = quickSort(wordLetters);
        String returnedWord = "";
        for (int i = 0; i < returnedLetters.length; i++)
            returnedWord = returnedWord + "" + returnedLetters[i];

        //return statment
        return returnedWord;
    }

    public char[] quickSort(char[] inputLetters) {
        if (inputLetters.length <= 1)
            return inputLetters;
        else {
            char[] array1 = new char[inputLetters.length];
            char[] array2 = new char[inputLetters.length];

            char[] partition = new char[1];
            partition[0] = inputLetters[0];

            int inputLettersIndex = 1;
            int array1Index = 0;
            int array2Index = 0;
            for (int i = inputLettersIndex; i < inputLetters.length; i++){
                if (Character.compare(inputLetters[i], partition[0]) <= 0) {
                    array1[array1Index] = inputLetters[i];
                    array1Index++;
                } else {
                    array2[array2Index] = inputLetters[i];
                    array2Index++;
                }
                inputLettersIndex++;
            }

            //recursive method
            return mergeChars(quickSort(removeNulls(array1)), removeNulls(partition), quickSort(removeNulls(array2)));
        }
    }    

    public char[] mergeChars (char[] arr1, char[] arr2, char[] arr3) {

        char[] result = new char[arr1.length + arr2.length + arr3.length];
        int insertionIndex = 0;
        for (int i = 0; i < arr1.length; i++) {
            result[insertionIndex] = arr1[i];
            insertionIndex++;
        }
        for (int i = 0; i < arr2.length; i++) {
            result[insertionIndex] = arr2[i];
            insertionIndex++;
        }
        for (int i = 0; i < arr3.length; i++) {
            result[insertionIndex] = arr3[i];
            insertionIndex++;
        }
        return result;
    }

    public char[] removeNulls (char[] arr1) {
        int charCount = 0;
        for (int i = 0; i < arr1.length; i++)
            if (arr1[i] != 0) {charCount++;}

        int insertionIndex = 0;
        char[] result = new char[charCount];
        for (int i = 0; i < arr1.length; i++)
            if (arr1[i] != 0) {
                result[insertionIndex] = arr1[i];
                insertionIndex++;
            }
        return result;
    }
    
    public String toString () {
        return (originalWord);
    }
    
    
    
}

