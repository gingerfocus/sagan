public class DogTester {
    public static void main (String [] args) {
        Dog dog1 = new Dog (1, "Steve", 345);
        Dog dog2 = new Dog (2, "Jimbo", 341);
        Dog dog3 = new Dog (4, "Johny", 735);
        
        System.out.println(dog1.toString());
        System.out.println(dog2.toString());
        System.out.println(dog3.toString());
        
        System.out.println(dog1.getName() + " is " + dog1.convertToHumanYears() + " in human years");
        System.out.println(dog2.getName() + " is " + dog2.convertToHumanYears() + " in human years");
        System.out.println(dog3.getName() + " is " + dog3.convertToHumanYears() + " in human years");
        
        System.out.println("DogID Check is: " + dog1.getDogIDCheck());
        System.out.println("DogID Check is: " + dog2.getDogIDCheck());
        System.out.println("DogID Check is: " + dog3.getDogIDCheck());
        
        System.out.println("DogTag is: " + dog1.getDogTag());
        System.out.println("DogTag is: " + dog2.getDogTag());
        System.out.println("DogTag is: " + dog3.getDogTag());
        
        System.out.println(DogHelper.checkDogTag("HG34"));
        System.out.println(DogHelper.checkDogTag("345H"));
    }
}
