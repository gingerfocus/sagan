public class MatrixArrayFunTester
{
    public static void main(String[] args)
    {
        MatrixArrayFun myMatrix = new MatrixArrayFun(5,6);
        
        System.out.println(myMatrix);
        
        myMatrix.swapRows(2,4);
        
        System.out.println(myMatrix);
        
        myMatrix.replaceAll(0, -1);
        
        System.out.println(myMatrix);
        
        System.out.println(MatOps.countIt(myMatrix.getMat(), 5));
        
        System.out.println(MatOps.countOdds(myMatrix.getMat()));
        
    }
}

