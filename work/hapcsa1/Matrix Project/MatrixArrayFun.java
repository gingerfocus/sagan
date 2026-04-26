public class MatrixArrayFun
{
    
    private int mat[][];
    
    // fill in mat with random integers from 0-9. mat has rowNumber rows and ColNumber columns    
    public MatrixArrayFun(int rowNumber, int colNumber)
    {   
        for (int m = 0; m < mat.length; m++)
            for (int n = 0; n < mat[0].length; n++)
                mat[m][n] = (int)(Math.random() * 10);
    }
    
    //write the getter for this class
    public int[][] getMat () {
        return mat;
    }
     
    // complete the method replaceAll below.    
    // replaceAll will replace all oldVal in mat with newVal
    public void replaceAll(int oldVal, int newVal)
    {
        for (int m = 0; m < mat.length; m++)
            for (int n = 0; n < mat[0].length; n++)
                if (mat[m][n] == oldVal)
                    mat[m][n] = newVal;
    }
    
    // Complete method swapRows below. 
    // swapRows will swap rowOne and rowTwo in mat
    public void swapRows(int rowOne, int rowTwo)
    {
        int[] rowStorage = new int [mat[rowOne].length];
        for (int i = 0; i < mat[rowOne].length; i++) {
            mat[rowOne][i] = rowStorage[i];
            mat[rowOne][i] = mat[rowTwo][i];
        }
        for (int i = 0; i < mat[rowOne].length; i++) 
            mat[rowTwo][i] = rowStorage[i]; 
    }
    
    // Write the toString method below. 
    public String toString()
    {
        return "Mat is a group of " + mat.length+1 + " array(s) of length " + mat[0].length+1;
    }
}
