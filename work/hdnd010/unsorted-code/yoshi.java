import java.util.Scanner;

public class yoshi {
    public static void yoshiSquareAsk () {
        Scanner keyboard = new Scanner(System.in);
        System.out.print("enter an yoshi: ");
        String input = keyboard.nextLine(); 
        try {
            int inp = Integer.parseInt(input);
            yoshiSquare(inp);
        }
        catch (Exception e) {
            System.out.println("yoshi is not compatable with the " + input + ". only the wii");
        }
    }

    public static void yoshiSquare (int yoshi) {
        String line1 = "⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠴⢿⣧⣤⣄          ";
        String line2 = "⠀⠀⠀ ⠀ ⠀⠀⠀⢀⣴⣿⣧⣆⣘⡄⢹⣿⣷⣆        ";
        String line3 = "⠀⠀  ⠀ ⠀⠀⣴⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣷⡀      ";
        String line4 = "   ⠀ ⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⣿⣿⣿⣿⡀     ";
        String line5 = "    ⠀⢀⣀⡀⣾⡿⠀⠉⠉⠛⠋⠛⠛⠚⣿⣿⣿⣿⣿⣿⣷⣄  ";
        String line6 = "   ⠀⢠⣍⠹⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⡿  ";
        String line7 = " ⠀⠀⠀⢿⣷⣾⣿⣿⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣷   ";
        String line8 = "⠀⠀⠀⠀⠀⢹⣟⢻⣿⣄⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇   ";
        String line9 = "⠀⠀⠀⠀⠻⠿⠟⠁⠑⢶⣤⣴⣿⣿⣿⣷⣶⣬⣿⣿⣿⡿      ";
        String line10 = "        ⠀⠀⠈⠙⠛⠛⢛⣿⣿⣿⣿⡿⠛⠁      ";
        String line11 = "               ⠻⢿⡿⠟         ";

        String[] yoshiLines = new String[] {line1, line2, line3, line4, line5, line6, line7, line8, line9, line10, line11};

        // checks if the person hates yoshi
        if (yoshi <= 0) {
            for (int i = 0; i < 79; i++) {System.out.println("you made yoshi sad. think about your actions");}
            System.out.print("you made yoshi sad. think about your actions");
            wait(10000);
            
            //clears screen
            System.out.print("\033[H\033[2J");
            System.out.flush();;
        } else {
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ yoshi zone begin ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            for (int i = 0; i < yoshi; i++) {    
               for (String l : yoshiLines) {
                   System.out.println(l + l + l + l + l);
               }
            }
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ yoshi zone end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        }
    }
    
    public static void wait(int ms){
        try {Thread.sleep(ms);}
        catch(InterruptedException ex) {Thread.currentThread().interrupt();}
    }
}
