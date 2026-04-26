import java.util.ArrayList;
//import java.util.Random;

public class Recursion {
  public static long nonConsecutiveSubsets(int n) {
    if (n <= 0) {
      return 1;
    } else {
      return nonConsecutiveSubsets(n-1) + nonConsecutiveSubsets(n-2);
      //number of solutions of size one less + number of solutions where you can slap the number at the end on
    }
  } //DONE - Verg good codesings

  public static long waysToJumpUpStairs(int n) {
    long numJumps = 0;
    if (n == 0) {return 1;} 
    if (n > 0) {numJumps += waysToJumpUpStairs(n-1);}
    if (n > 1) {numJumps += waysToJumpUpStairs(n-2);}
    if (n > 2) {numJumps += waysToJumpUpStairs(n-3);}  
    return numJumps;
  } //DONE - SMALL OPTIMZATION MOST LIKLY POSSIBLE

  public static void reverseList(ListNode node) {
    if (node.getNext() == null) {
      System.out.println(node.getValue());
    } else {
      reverseList(node.getNext());
      System.out.println(node.getValue());
    }
  } //DONE - STILL NOT TESTED

  //"this just works" -todd howard, speaking about fallout 76's code
  public static void infect(String[][] grid, int r, int c) {
        if (!checkIfOut(grid, r, c) && !grid[r][c].equals("vaccinated") && !grid[r][c].equals("infected")) {
            grid[r][c] = "infected";
            infect(grid , r-1, c);
            infect(grid , r+1, c);
            infect(grid , r, c-1);
            infect(grid , r, c+1);
        }
  } //DONE
    
  //prints all the permutations of a word
  public static void subsets(String str) {  
        subsetsHelper(str);
        //a clasic of our time
  } //DONE

  //prints out all possible subsets of an string
  public static void permute(String str) {
    for (int i = 0; i < str.length(); i++) {
      String popedWord = str.substring(0, i) + str.substring(i+1, str.length());
      ArrayList<String> wordsMinus1 = permuteHelper(popedWord);

      //prints it all out so we can dump the memory on the next loop
      for (String word : wordsMinus1) {System.out.println(str.charAt(i) + word);}
    }
  } //DONE - COULD BE BETTER

  public static void mergeSort(int[] array) {
    int[] outArray = mergeSortHelper(array, 0, array.length);
    for (int i = 0; i < array.length; i++) {
      array[i] = outArray[i];
    }
  } //DONE - COULD BE DONE IN PLACE

  public static void quickSort(int[] array) {
    quicksortHelper(array, 0, array.length - 1); //possibly -1
    //another classic
  } //INCOMPLEAT

  //return max number of points given two arrays
  public static int scavHunt(int[] times, int[] points) {
    return scavHuntHelper(times, points, -5, 0);
    //a true classic, no more fake classics
  } //DONE
    
  //sloves the game of hanoi by returning an ArrayList of how you can move the peices to win
  public static void solveHanoi(int n) {
    ArrayList<String> output = hanoiSolverHelper(n, 0, 1);
    for (int i = 0; i < output.size(); i++) {
      System.out.println(output.get(i));
    }
  } //DONE

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

///*
  public static void main (String [] args) {
    int testLimit = 11;

    testStairs(testLimit);
    System.out.println("");
    testNonConsec(testLimit);
    System.out.println("");

    SinglyLinkedList a = new SinglyLinkedList();
    a.add("a"); a.add("b"); a.add("c"); a.add("d"); 
    reverseList(a.getHead());

    System.out.println("");

        String[][] infectArray = new String[][]{{"----------", "----------", "vaccinated", "----------", "----------"},
                                                {"----------", "----------", "vaccinated", "----------", "----------"},
                                                {"----------", "----------", "vaccinated", "----------", "----------"},
                                                {"----------", "vaccinated", "----------", "----------", "----------"},
                                                {"vaccinated", "----------", "----------", "----------", "----------"}};
        print2d(infectArray);

        System.out.println("");

        infect(infectArray, 4, 4);
        print2d(infectArray);


        System.out.println("");


        int[] array1 = new int[]{82, 4, 37, 9187, 0, -14, 9, 941, 88, -14829, 6789, 124, 12, 124, 0, 1453, 98, 977, 91, 987, 0};
        System.out.print("Base Array: "); printArr(array1, 0, array1.length);
        mergeSort(array1);
        System.out.print("Merge Sort Array: "); printArr(array1, 0, array1.length);
       

        System.out.println("");

        
        int[] array2 = new int[]{5, 4, 3, 2, 1, 0};
        System.out.print("Base Array: "); printArr(array2, 0, array2.length);
        
        quickSort(array2);
        System.out.print("Quicksort Array: "); printArr(array2, 0, array2.length);


        System.out.println("");
 

        System.out.println("Permutations of ABC:");
        permute("andy");


        System.out.println("");


        System.out.println("Subsets of ABC:");
        subsets("andy");


        System.out.println("");


        int[] times = new int[]{1, 6, 10, 11, 15};
        int[] scores = new int[]{6, 5, 3, 1, 3};
        System.out.print("Times: "); printArr(times, 0, times.length);
        System.out.print("Scores: "); printArr(scores, 0, scores.length);
        System.out.print("Max Points: "); System.out.println(scavHunt(times, scores));


        System.out.println("");


        System.out.println("Hanoi Solver: ");
        solveHanoi(3);
    }
//*/

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
                _     _       _                       _______             _               _                     
               (_)   (_)     | |                     (_______)        _  | |             | |                    
 _____ _____    _______ _____| | ____  _____  ____    _  _  _ _____ _| |_| |__   ___   __| | ___    _____ _____ 
(_____|_____)  |  ___  | ___ | ||  _ \| ___ |/ ___)  | ||_|| | ___ (_   _)  _ \ / _ \ / _  |/___)  (_____|_____)
               | |   | | ____| || |_| | ____| |      | |   | | ____| | |_| | | | |_| ( (_| |___ |               
               |_|   |_|_____)\_)  __/|_____)_|      |_|   |_|_____)  \__)_| |_|\___/ \____(___/                
                                |_|                                                                             
*/

  private static ArrayList<String> hanoiSolverHelper(int n, int start, int end) {
        if (n == 1) {
            ArrayList<String> retStrings = new ArrayList<String>();
            retStrings.add(start + " -> " + end);
            return retStrings;
        } else {
            ArrayList<String> retStrings = new ArrayList<String>();
            retStrings.addAll(hanoiSolverHelper(n-1, start, (3 - start - end)));
            retStrings.add(start + " -> " + end);
            retStrings.addAll(hanoiSolverHelper(n-1, (3 - start - end), end));
            return retStrings;
        }
  } //DONE

  private static ArrayList<String> permuteHelper(String str) {
        if (str.length() <= 0) {
            ArrayList<String> retString = new ArrayList<String>();
            retString.add("");
            return retString;
        } else {
            ArrayList<String> list = new ArrayList<String>();
            
            for (int i = 0; i < str.length(); i++) {
                String popedWord = str.substring(0, i);
                popedWord += str.substring(i+1, str.length());
                ArrayList<String> wordsMinus1 = permuteHelper(popedWord);

                for (String word : wordsMinus1) {
                    list.add(str.charAt(i) + word);
                }
            }
            return list;
        }
  } //DONE - COULD BE BETTER

  private static int[] mergeSortHelper(int[] array, int lowBound, int highBound) {
        if (highBound - lowBound <= 1) {
            return new int[]{array[lowBound]};
        } else {
            int[] arr1 = mergeSortHelper(array, lowBound, (highBound + lowBound)/2);
            int[] arr2 = mergeSortHelper(array, (highBound + lowBound)/2,  highBound);
            int[] mergedArray = merge(arr1, arr2);
            return mergedArray;
        }
  } //DONE

  private static int scavHuntHelper(int[] times, int[] points, int time, int numPoints) {
        int maxPointsFound = numPoints;
        for (int i = 0; i < times.length; i++) {
          if (times[i] >= time + 5) {
            int pointsFound = scavHuntHelper(times, points, times[i], numPoints + points[i]);
            if (pointsFound > maxPointsFound) {
              maxPointsFound = pointsFound;
            }
          }
        }
        return maxPointsFound;
  } //DONE

  private static ArrayList<String> subsetsHelper (String str) {
        if (str.length() <= 0) {
            ArrayList<String> retList = new ArrayList<String>();
            retList.add("");
            System.out.println(retList.get(0));
            return retList;
        } else {
            String remLetter = str.substring(0, 1);
            String popedWord = str.substring(1, str.length());
            ArrayList<String> wordsMinus1 = subsetsHelper(popedWord);

            int sizeAtInception = wordsMinus1.size();
            for (int i = 0; i < sizeAtInception; i++) {
                String addedWord = remLetter + wordsMinus1.get(i);
                wordsMinus1.add(addedWord);
                System.out.println(addedWord);
            }

            return wordsMinus1;
        }
  } //DONE - CODE LOOKS SLOPPY

  private static void quicksortHelper(int[] array, int start, int end) {
    if (end <= start + 1) {
      return;
    } else {
      //pivoting
      int pivotInd = pivot(array, start, end);

      System.out.println(array[pivotInd]);

      //recursive call
      quicksortHelper(array, start, pivotInd);
      quicksortHelper(array, pivotInd+1, end);
    }
  } //MOSTLY WORKS?

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
                 ______            _  _      _        _______             _               _                     
                / _____) _        | |(_)    | |      (_______)        _  | |             | |                    
 _____ _____   ( (____ _| |_ _   _| | _  ___| |__     _  _  _ _____ _| |_| |__   ___   __| | ___    _____ _____ 
(_____|_____)   \____ (_   _) | | | || |/___)  _ \   | ||_|| | ___ (_   _)  _ \ / _ \ / _  |/___)  (_____|_____)
                _____) )| |_| |_| | || |___ | | | |  | |   | | ____| | |_| | | | |_| ( (_| |___ |               
               (______/  \__)\__  |\_)_(___/|_| |_|  |_|   |_|_____)  \__)_| |_|\___/ \____(___/                
                            (____/                                                                                                                                    
*/
  //pivots the array and returns the index of the pivot
  private static int pivot(int[] array, int start, int end) {
    int pivot = (int)(Math.random() * (end - start + 1)) + start;
    int pivotValue = array[pivot];

    //swaping pivot
    swapInt(array, pivot, start);

    //shifting based on pivot
    int frontPointer = start + 1;
    int endPointer = end;


    while (frontPointer != endPointer) {
      if (array[frontPointer] <= pivotValue) {
        frontPointer++;
      } else if (array[endPointer] > pivotValue) {
        endPointer--;
      } else {
        swapInt(array, frontPointer, endPointer);
      }
    }       

    swapInt(array, start, endPointer-1);
    return endPointer;
  } //good
  private static void swapInt(int[] array, int ind1, int ind2) {
        int temp = array[ind1];
        array[ind1] = array[ind2];
        array[ind2] = temp;
  } //good
  public static void print2d(String[][] grid) {
        for (int i = 0; i < grid.length; i++) {
            for (int j = 0; j < grid[i].length; j++) {
                System.out.print(grid[i][j] + ", ");
            }
            System.out.println("");
        }
  } //good
  private static boolean checkIfOut(String[][] grid, int r, int c) {
        if (r < 0 || r >= grid.length || c < 0 || c >= grid[r].length) {return true;}
        else {return false;}
  } //good
  public static void printArr(int[] array, int start, int end) {
        System.out.print("[");
            System.out.print(array[start]);
        for (int i = start+1; i < end; i++) {
            System.out.print(", " + array[i]);
        }
        System.out.println("]");
  } //good
  private static int[] merge (int[] arr1, int[] arr2) {
        int[] combinedArray = new int[arr1.length + arr2.length];

        int arr1Index = 0;
        int arr2Index = 0;

        for (int i = 0; i < combinedArray.length; i++) {
            if (arr1Index >= arr1.length) {
                combinedArray[i] = arr2[arr2Index];
                arr2Index++;
            } else if (arr2Index >= arr2.length) {
                combinedArray[i] = arr1[arr1Index];
                arr1Index++;
            } else if (arr1[arr1Index] < arr2[arr2Index]) {
                combinedArray[i] = arr1[arr1Index];
                arr1Index++;
            } else {
                combinedArray[i] = arr2[arr2Index];
                arr2Index++;
            }
        }
        return combinedArray;
  } //good
  private static void testStairs (int testLimit) {
    for (int i = 0; i < testLimit; i++) {
      System.out.println("Ways To Jump Up Stairs (" + i + "): " + waysToJumpUpStairs(i));
    }
  } //good
  private static void testNonConsec(int testLimit) {
    for (int i = 0; i < testLimit; i++) {
      System.out.println("Non-Consec Subsets (" + i + "): " + nonConsecutiveSubsets(i));
    }
  } //good
}
