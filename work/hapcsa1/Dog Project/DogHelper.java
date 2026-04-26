public class DogHelper
{
    static char computeDogIDCheck (int dogID)
    {
        int didget3 = dogID % 10;
        int didget2 = dogID % 100 / 10;
        int didget1 = dogID % 1000 / 100;
        return (char)(70 + (didget1 + didget2 + didget3) % 10);
    }
    
    static boolean checkDogTag(String dogTag)
    {
        if (Integer.parseInt(dogTag) != 0)
            return false;
        else 
            return true;
    }
}
