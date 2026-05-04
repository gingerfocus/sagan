import java.util.Date;

public class Perishable extends InventoryItem   // complete this class
{
    protected int id;
    protected Date entry;
    protected double basePrice;
    
    public Perishable (Date entryDate, double price) {
        super(entryDate, price);
    }
    
    public double getPrice(){
        Date curDate = new Date();
        if (entry.before(curDate)){
            return basePrice;
        } else {
            return basePrice * 0.9;
        }
    }
}
