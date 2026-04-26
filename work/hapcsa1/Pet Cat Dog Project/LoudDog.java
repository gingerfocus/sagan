public class LoudDog extends Dog
{
    //instance variables
    
    //constructor
    public LoudDog(String petName){
        super(petName);
    }
    
    public String speak() {
        return (super.speak()+ " " + super.speak());
    }
}
