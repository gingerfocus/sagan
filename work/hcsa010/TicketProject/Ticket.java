public abstract class Ticket
{
    //instance variables
    private int serialNumber;
    
    //constructor
    public Ticket()
    {
        serialNumber = getNextSerialNumber();
    }
    
    //setters and getters
    
    
    //other methods
    public abstract double getPrice();
    
    public String toString()
    {
        return "Number: " + serialNumber + "\nPrice: " + getPrice();
    }
    
    private static int getNextSerialNumber()
    {
        return (int)(Math.random() * 1000);
    }
}