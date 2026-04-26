import java.util.List;

public class Kennel
{
    //instance variables
    private List<Pet> petList;
    
    //constructor
    public Kennel(List<Pet> list)
    {
        petList = list;
    }
    
    //setters and getters
    public List<Pet> getPetList () {
        return petList;
    }
    public Pet getPet (int index) {
        return petList.get(index);
    }
    
    //other methods
    public void allSpeak()
    {
        for(Pet pet : petList) {
            System.out.println(pet.getName() + ": " + pet.speak());
        }
    }
}
