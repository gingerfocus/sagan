public class PetTester
{
    public static void main(String[] args)
    {
        Dog tim = new Dog("tim", 0);
        Dog timmmy = new Dog("timmy", 0);
        Cat timothy = new Cat("timothy", false);

        tim.brushHair();
        timmy.brushHair();

        timothy.getIsPurring();

        tim.bite(timmy);
        timothy.bite(tim);
        timmy.bite(timmy);
        timothy.bite(timmy);
        tim.bite(timmy);
       
        System.out.println("dog bite count: " + timmy.getMisbehaveCount());  
        System.out.println("cat bite count: " + timothy.getMisbehaveCount());       
              
    }
}
