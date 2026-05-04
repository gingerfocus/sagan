public class BarrelTester
{
    public static void main(String[] args)
    {
        Monkey[] munks = new Monkey[10];
        for(int k=0; k < munks.length; k++)
        {
            int bCount = (int)(Math.random()*10);
            munks[k] = new Monkey(bCount, bCount*2);
        }
        int rows = 3;
        int cols = 4;
        BarrelOfFun bFun = new BarrelOfFun(rows, cols, munks);
        System.out.println("Printing 2D-Array");
        System.out.println(bFun);
        System.out.println("Monkey with most bananas " + bFun.getMonkeyWithMostBananas());
    }
}