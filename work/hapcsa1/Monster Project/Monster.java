import static java.lang.System.*;

public class Monster
{
    private int myWeight;
    private int myHeight;
    private int myAge;

    //write a no parameter constructor
    public Monster ()
    {
        myWeight = 0;
        myHeight = 0;
        myAge = 0; 
    }

    //write an initialization constructor with an int parameter ht
    public Monster (int ht) {
        myWeight = 0;
        myHeight = ht;
        myAge = 0;
    }

    //write an initialization constructor with int parameters ht and wt
    public Monster (int ht, int wt) {
        myWeight = wt;
        myHeight = ht;
        myAge = 0;
    }
      //write an initialization constructor with int parameters ht, wt, and age
    public Monster (int ht, int wt, int age) {
        myWeight = wt;
        myHeight = ht;
        myAge = age;
    }


    //modifiers - write set methods for height, weight, and age
    public int getWeight () {
        return myWeight;
    }
    public int getHeight () {
        return myHeight;
    }
    public int getAge () {
        return myAge;
    }
    
    //accessors - write get methods for height, weight, and age
    
    
    
    //creates a new copy of this Object
    public Object clone()
    {
        
    }

    public boolean equals(Monster other)
    {

    }

    public int compareTo(Monster other)
    {

    }

    //write a toString() method
    
    
}
