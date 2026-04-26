public class Ball
{
    public Ball (int numberOfBalls, String usedFor, boolean isBouncing)
    {
        balls = numberOfBalls;
        sport = usedFor;
        bouncing = isBouncing;
    }
    
    private boolean bouncing;
    private int balls;
    private String sport;
    
    public int getBalls () {
        return (balls);
    }
    
    public String getSport () {
        return (sport);
    }
    
    public boolean getBouncing () {
        return (bouncing);
    }
    
    public void setBalls (int newValue) {
        balls = newValue;
    }
    
    public void setSport (String newValue) {
        sport = newValue;
    }
    
    public void setBouncing (boolean newValue) {
        bouncing = newValue;
    }
    
    public boolean moreThanThree () {
        if (balls > 3)
            return true;
        else
            return false;
    }
    
    public String toString () {
        if (bouncing)
        {
            return ("There are " + balls + " bouncing " + sport +" ball(s)");
        } else
        {
            return ("There are " + balls + " grounded " + sport +" ball(s)");
        }
   
    }
}
