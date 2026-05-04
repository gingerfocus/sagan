public class Player
{
    private String name;
    private String choice;
    
    public Player (String playerName, String playerChoice) {
        name = playerName;
        choice = playerChoice;
    }
    
    public void setName(String playerName) {
        name = playerName;
    }
    public void setChoice(String playerChoice) {
        choice = playerChoice;
    }
    
    public String getName () {
        return name;
    }
    public String getChoice () {
        return choice;
    }
    
    public String toString () {
        return (name + " chose "+ choice);
    }
}
