public abstract class Pet
{
    //instance variables
    private String name;
    
    //constructor
    public Pet(String petName)
    {
        name = petName;
    }
    
    //setters and getters
    public String getName()
    {
        return name;
    }
    
    //other methods
    public abstract String speak();
}
