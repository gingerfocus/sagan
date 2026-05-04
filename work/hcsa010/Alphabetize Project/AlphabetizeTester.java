
import java.util.Collections;
import java.util.ArrayList;
import static java.lang.System.*;

public class AlphabetizeTester
{
    public static void main(String args[])
    {
        Alphabetize words = new Alphabetize ();
        words.add("alice");
        System.out.println ("adding alice");
        words.add ("tommy");
        System.out.println ("adding tommy");
        words.add ("bobby");
        System.out.println ("adding bobby");
        words.add ("annabell");
        System.out.println ("adding annabell");
        words.add ("sallysue");
        System.out.println ("adding sallysue");
        words.add ("sallymae");
        System.out.println ("adding sallymae");
        System.out.println("printing the list :: " + words + "\n");
        words.remove("bobby");
        System.out.println ("removing bobby");
        System.out.println("printing the list :: " + words + "\n");
        words.remove("alice");
        System.out.println ("removing alice");
        System.out.println("printing the list :: " + words + "\n");
        words.add("fred");
        System.out.println ("adding fred");
        words.add("xylophone");
        System.out.println ("adding xylophone");
        System.out.println("printing the list :: " + words + "\n");
        /**
         * words.remove("tommy");
        System.out.println ("removing tommy");
        System.out.println("printing the list :: " + words + "\n");
        words.remove ("fred");
        System.out.println ("removing fred");
        words.remove("annabell");
        System.out.println ("removing annabell");
        words.remove("sallysue");
        System.out.println ("removing sallysue");
        System.out.println("printing the list :: " + words);
        */
    }
}
