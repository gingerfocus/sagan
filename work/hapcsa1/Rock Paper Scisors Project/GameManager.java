public class GameManager
{    
    private Player player;
    private Computer computer;
    
    public GameManager() {
        player = new Player ("", "");
        computer = new Computer();
    }
    
    public void setPlayerInformation (String playerName, String playerChoice) {
        player.setName(playerName);
        player.setChoice(playerChoice);
    }
    
    public boolean didPlayerWin () {
        if (player.getChoice().equals("rock") && computer.getChoice().equals("scissors"))
            return true;
        else if (player.getChoice().equals("paper") && computer.getChoice().equals("rock"))
            return true;
        else if (player.getChoice().equals("scissors") && computer.getChoice().equals("paper"))
            return true;
        else
            return false;
    }
}
