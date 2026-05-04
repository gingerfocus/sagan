import java.util.*;

public class Tester
{
    public static void main(String[] args)
    {
        ArrayList animals = new ArrayList<Pet> (Arrays.asList(new Dog("Faye"), new Cat("Kitty"), new LoudDog("Rover")));
        Kennel myPets =  new Kennel(animals);
        myPets.allSpeak();
    }
    
}
