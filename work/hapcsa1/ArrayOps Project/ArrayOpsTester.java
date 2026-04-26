public class ArrayOpsTester
{
    public static void main(String[] args)
    {
        // testing Question 1
        int[] intArray = {1,3,-2,7,-5,12,2,3,0,10,-4};
        System.out.println("max value in intArray: " + ArrayOps.findMax(intArray));
        
        // testing Question 2
        String[] stringArray = {"apple","banana","pear","pineapple","peaches","orange","mango"};
        System.out.println("longest string in stringArray: " + ArrayOps.findLongestString(stringArray));
        
        // testing Question 3
        System.out.println("average string length in stringArray: " + ArrayOps.averageStringLength(stringArray));
        
        // testing Question 4
        System.out.println("letter frequencies");
        int[] results = ArrayOps.countLetterFrequencies("We the people of the United States, in Order to form a more perfect Union,...");
        char letter = 'A';
        for(int k=1; k < results.length; k++)
        {
            System.out.print(letter + ": " + results[k]);
            letter++;
            System.out.println();
        }
        
        
        // testing Question 5
        System.out.println("Remove int and scoot");
        results = ArrayOps.removeIntAndScoot(intArray, 4);
        for(int k=0; k < results.length; k++)
        {
            System.out.print(results[k] + " ");
        }
        
        System.out.println();
        
        
        // testing Question 6
        System.out.println("resized array");
        results = ArrayOps.resizeIntArray(intArray);
        for(int k=0; k < results.length; k++)
        {
            System.out.print(results[k] + " ");
        }
        
        System.out.println();
        
        
        // testing Question 7
        System.out.println("add num to string");
        String[] stringArr = ArrayOps.addNumToStringArray(stringArray);
        for(int k=0; k < stringArr.length; k++)
        {
            System.out.print(stringArr[k] + " ");
        }
        
        System.out.println();
        
        
        // testing Question 8
        System.out.println("reverse array");
        results = ArrayOps.reverseIntArray(intArray);
        for(int k=0; k < results.length; k++)
        {
            System.out.print(results[k] + " ");
            
        }
        
    }
    
}