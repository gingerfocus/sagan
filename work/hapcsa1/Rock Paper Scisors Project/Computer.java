public class Computer
{
    private String choice;
    
    public Computer() {
        choice = this.randomChoice();
    }

    public String randomChoice () {
        int choice = (int)(Math.random()*3);
        if (choice == 0)
            return "rock";
        else if (choice == 1)
            return "paper";
        else
            return "scissors";
    }
    
    public String getChoice () {
        return choice;
    }
    
    public String toString () {
        return ("The computer chose " + choice);
    }
}
