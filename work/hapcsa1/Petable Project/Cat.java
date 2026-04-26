public class Cat implements petable {
    private String name;
    private boolean isPurring;
    private static int totalCatMisbehaveCount = 0;

    public Cat (String name, boolean isPurring) {
        this.name = name;
        this.isPurring = isPurring;
    }

    public void bite (Object other){
        if (other instanceof Dog){
            totalDogMisbehaveCount++;
            other.setTailWag(0);
        }  
    }
    
    public void brushHair (){
        isPurring = true;
    }

    public String getName(){return name;}
    public boolean getPurring(){return isPurring;}
    public static int getMisbehaveCount(){return totalCatMisbehaveCount;}

    public void setName(String name){this.name = name;}
    public void setPurring(boolean isPurring){this.isPurring = isPurring;}
}
