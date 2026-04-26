public class ArrayUtils {
    
    // countOdds
    // counts the number of odds
    public static int countOdds(int[] nums) {
        int odds = 0;
        for (int num : nums) 
            if (num % 2 != 0) {odds++;}
        return odds;
    }
    
    // onDiagonal
    // does things and returns true if the test int is on the diagonal of the matrix
    // always false if matrix is not square
    public static boolean onDiagonal(int[][] matrix, int test) {
        //checking if it is square
        if (matrix.length != matrix[0].length) {return false;}

        for (int i = 0; i < matrix.length; i++) {
            if (matrix[i][i] == test || matrix[matrix.length - i - 1][i] == test) {return true;}
        }
        return false;
    }
    
    // addElements
    // increments one array using another
    // if array is wrong sized it is assumed to be 0
    public static void addElements(int[] list, int[] increment) {
        int incremental = 0;
        for (int i = 0; i < list.length; i++) {
            if (i >= increment.length)
                 list[i] += 0;
            else
                list[i] += increment[i];
        }
    }
    
    // embiggen
    // makes 2d array and compares each value in array1 to array2 and sets their intersection to the higher value
    // this code is really bad but i cant be bothered to think right now
    public static int[][] embiggen(int[] array1, int[] array2) {
        int [][] arr2d = new int [array1.length][array2.length];
        for (int i = 0; i < arr2d.length; i++){
            for (int j = 0; j < arr2d[i].length; j++){
                if (array1[i] > array2[j])
                    arr2d[i][j] = array1[i];
                else
                    arr2d[i][j] = array2[j];
            }
        }
        return arr2d;
    }

    public static void main (String [] args) {
        yoshi.yoshiSquare();

    }
}