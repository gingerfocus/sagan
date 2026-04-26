public class ApLineTester {
    public static void main (String [] args) {
        ApLine line1 = new ApLine(3, 4, -17);
        ApLine line2 = new ApLine(6, 5, -12);
        
        int x = 5;
        int y = 6;
        
        System.out.println(line1);
        System.out.println(line2);
        line1.setVarA(4);
        line2.setVarA(4);
        System.out.println("Line1 slope: " + line1.getSlope());
        System.out.println("Line2 slope: " + line1.getSlope());
        if (line1.isOnLine(x, y))
            System.out.println("Point (" + x + ", " + y + ") is on line 1");
        else
            System.out.println("Point (" + x + ", " + y + ") isnt on line 1");
            
        if (line2.isOnLine(x, y))
            System.out.println("Point (" + x + ", " + y + ") is on line 2");
        else
            System.out.println("Point (" + x + ", " + y + ") isnt on line 2");
    }
}
