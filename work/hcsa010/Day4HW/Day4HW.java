import java.util.ArrayList;
public class Day4HW {
    public static void main(String[] args) {
        String[] strArray = {"first", "second", "third", "fourth", "fifth"};
        String[] strArray2 = {"one", "two", "three", "four", "five"};
        
        lastComesFirst(strArray);
        System.out.println ("Array: last element first");
        printArray(strArray);
        
        firstComesLast(strArray2);
        System.out.println ("Array: first element last");
        printArray(strArray2);        
        
        ArrayList<String> list1 = new ArrayList<String>();
        list1.add("first");
        list1.add("second");
        list1.add("third");
        list1.add("fourth");
        list1.add("fifth");
        
        ArrayList<String> list2 = new ArrayList<String>();
        list2.add("one");
        list2.add("two");
        list2.add("three");
        list2.add("four");
        list2.add("five");
        
        System.out.println ("ArrayList: last element first");
        lastComesFirst(list1);
        System.out.println (list1);
        System.out.println ("ArrayList: first element last");
        firstComesLast(list2);
        System.out.println (list2);
        
    }
    
    // method to print an array
    public static void printArray(String[] arr)
    {
        for(int k=0; k < arr.length; k++)
        {
            System.out.print (arr[k] + " ");
        }
        System.out.println();
    }
    
    //this method returns the input array but with the last element first.
    public static void lastComesFirst(String[] arr)
    {
       arr[0] = arr[arr.length-1];
    }
    
    //this method returns the input array but with the first element last.
    public static void firstComesLast(String[] arr)
    {
        arr[arr.length-1] = arr[0];
    }
    
    //this method returns the input ArrayList but with the last element first.
    public static void lastComesFirst(ArrayList<String> arrList)
    {
        arrList.set(0, arrList.get(arrList.size()-1));
    }
    
    //this method returns the input ArrayList but with the first element last.
    public static void firstComesLast(ArrayList<String> arrList)
    {
        arrList.set(arrList.size()-1, arrList.get(0));
    }
}


