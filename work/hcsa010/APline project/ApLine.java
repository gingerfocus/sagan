public class ApLine
{
    private int A;
    private int B;
    private int C;
    
    public ApLine(int variableA, int variableB, int variableC) {
        A = variableA;
        B = variableB;
        C = variableC;
    }
    
    public int getVarA () {
        return A;
    }
    public int getVarB () {
        return B;
    }
    public int getVarC () {
        return C;
    }
    
    public void setVarA (int newValue) {
        A = newValue;
    }
    public void setVarB (int newValue) {
        B = newValue;
    }
    public void setVarC (int newValue) {
        C = newValue;
    }
    
    public double getSlope () {
        return (double)-A/B;
    }
    
    public boolean isOnLine (int x, int y) {
        if ((A * x) + (B * y) + C == 0)
            return true;
        else
            return false;
    }
    
    public String toString () {
        return ("The equation for the line is: (" + A + "x) + (" + B + "y) + (" + C + ") = 0");
    }
    
    public boolean equals (ApLine object2) {
        if (this.A == object2.A && this.B == object2.B && this.C == object2.C)
            return true;
        else
            return false;
    }
}