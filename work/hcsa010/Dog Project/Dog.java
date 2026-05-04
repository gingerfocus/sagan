public class Dog
{
    private int age;
    private String name;
    final private int legs;
    private int dogID;
    private char dogIDCheck;
    private String dogTag;

    public Dog(int age, String name, int dogID)
    {
        this.age = age;
        this.name = name;
        legs = 4;
        this.dogID = dogID;
        dogIDCheck = DogHelper.computeDogIDCheck(dogID);
        dogTag = "" + dogID + dogIDCheck; //or can use Integer.toString(dogID) + dogIDCheck
    }
    
    
    public int getAge () {
        return age;
    }
    public String getName () {
        return name;
    }
    public int getLegs () {
        return legs;
    }
    public int getDogID () {
        return dogID;
    }
    public char getDogIDCheck () {
        return dogIDCheck;
    }
    public String getDogTag () {
        return dogTag;
    }
    
    
    public void setAge (int newValue) {
        age = newValue;
    }
    public void setName (String newValue) {
        name = newValue;
    }
    public void setDogID (int newValue) {
        dogID = newValue;
        dogIDCheck = DogHelper.computeDogIDCheck(dogID);
    }
    
    
    public int convertToHumanYears () {
        if (age > 0)
            return (13 + ((16 * (age - 1)) / 3));
        else
            return (0);
    }
    
    public String toString() {
        return (name + " is a dog " + age + " year old dog with " + legs + " legs");
    }
}
