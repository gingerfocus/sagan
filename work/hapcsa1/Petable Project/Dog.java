public class Dog implements petable{
    private int tailWag;
    private String myName;
    private static int totalDogMisbehaveCount = 0;
    
    public Dog (String name, int tailWag) {
        this.name = name;
        this.tailWag = tailWag;
    }

    public void bite (Object other){
        if (other instanceof Cat){
            totalDogMisbehaveCount++;
            other.setIsPurring(false);
        }
    }
    
    public void brushHair (){
        tailWag++;
    }

    public String getName(){return name;}
    public int getPurring(){return tailWag;}
    public static int getMisbehaveCount(){return totalDogMisbehaveCount;}

    public void setName(String name){this.name = name;}
    public void setPurring(int tailWag){this.tailWag = tailWag;}
    
    public String toString() {
        System.out.println(name + " is a dog who has wagged his tail " + tailWag + " times and has misbehaved " + totalDogMisbehaveCount + " times");
    }
}