import java.util.ArrayList;

public class Warehouse
{
    //instance variables
    private ArrayList<InventoryItem> items;
    
    //write the constructor
    public Warehouse (ArrayList<InventoryItem> items) {
        this.items = items;
    }
    
    
    public ArrayList<InventoryItem> getItems(double lo, double hi)  // complete this method
    {   
        ArrayList<InventoryItem> rangedItems = new ArrayList<InventoryItem> ();
        for (int i = 0; i < items.size(); i ++) {
            if (items.get(i).getBasePrice() < hi && items.get(i).getBasePrice() > lo)
                rangedItems.add(items.get(i));
        }
        return rangedItems;
    }
}
