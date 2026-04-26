public class ArrayOps
{
    // Question 1
    public static int findMax (int numbers[]) {
        int maxValue = 0 ;
        for (int i = 0; i <= numbers.length - 1; i++)
            if (numbers[i] > maxValue)
                maxValue = numbers[i];
        return maxValue;
    }
    
    // Question 2
    public static String findLongestString (String strings[]){
        int indexOfMax = 0 ;
        for (int i = 0; i <= strings.length - 1; i++)
            if (strings[i].length() > strings[indexOfMax].length())
                indexOfMax = i;
        return strings[indexOfMax];
    }
    
    // Question 3
    public static double averageStringLength (String strings[]) {
        double totalLength = 0;
        for (int i = 0; i <= strings.length - 1; i++) {
            totalLength += strings[i].length();
        }
        return (totalLength / strings.length + 1);
    }
  
    // Question 4
    public static int[] countLetterFrequencies (String sentance) {
        String loweredString = sentance.toLowerCase();
        int [] letters = new int [27];
        for (int i = 0; i <= loweredString.length() - 1; i++) {
            if (loweredString.charAt(i) - 'a' >= 0 && loweredString.charAt(i) - 'a' <= 27)
                letters[loweredString.charAt(i) - 'a']++;
        }
        return letters;
    }
    
    
    // Question 5
    public static int[] removeIntAndScoot (int integers[], int removed) {
        for (int i = removed; i < integers.length - 1; i++)
            integers[i] = integers[i+1];
        integers[integers.length - 1] = 0;
        return integers;
    }
   
    // Question 6
    public static int[]resizeIntArray (int integers[]) {
        int [] longArray = new int [integers.length * 2];
        for (int i = 0; i < integers.length; i++)
            longArray[i] = integers[i];
        return longArray;
    }
    
    // Question 7
    public static String[] addNumToStringArray (String strings[]) {
        String storedString;
        for (int i = 0; i < strings.length; i++) {
            storedString = strings[i];
            strings[i] = "#" + (i + 1) + " " + storedString;
        }
        return strings;
    }
    
    // Question 8
    public static int[] reverseIntArray (int integers[]) {
        int [] reversedInts = new int [integers.length + 1];
        for (int i = 0; i < integers.length - 1; i++)
            reversedInts[i] = integers[integers.length - i - 1];
        return reversedInts;
    }
    
}