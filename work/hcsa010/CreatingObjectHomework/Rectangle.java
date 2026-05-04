public class Rectangle
{
    public Rectangle (int edge1, int edge2)
    {
        side1 = edge1;
        side2 = edge2;
    }
    
    public Rectangle (int edge1)
    {
        side1 = edge1;
        side2 = edge1;
    }
    
    private int side1;
    private int side2;
    
    public int getSide1 () {
        return (side1);
    }
    
    public void setSide1 (int newValue) {
        side1 = newValue;
    }
    
    public int getSide2 () {
        return (side2);
    }
    
    public void setSide2 (int newValue) {
        side2 = newValue;
    }
    
    public int getPerimeter () {
        return (2 * (side1 + side2));
    }
    
    public int getArea () {
        return (side1 * side2);
    }
    
    public String toString () {
        return ("The side lengths are " + side1 + " and "+ side2);
    }
}