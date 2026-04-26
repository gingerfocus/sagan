public class MatOps
{
    // Complete method countIt below.
    // countIt will return the number of times that val occurs in mat
    public static int countIt(int[][] mat, int val)
    {
        int count = 0;
        for (int m = 0; m < mat.length; m++)
            for (int n = 0; n < mat[0].length; n++)
                if (mat[m][n] == val)
                    count++;
        return count;
    }
    
    // Complete method countOdds below.
    // countOdds will return the number of odd numbers that exist in mat 
    public static int countOdds(int[][] mat)
    {
        int count = 0;
        for (int m = 0; m < mat.length; m++)
            for (int n = 0; n < mat[0].length; n++)
                if (mat[m][n] % 2 == 1)
                    count++;
        return count;
    }
}