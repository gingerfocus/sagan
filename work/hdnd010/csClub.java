import java.util.Scanner;
import java.io.*;
import java.net.*;
import java.util.Scanner;

public class csClub {
    public static void main(String[] args) {
        
        String token = "put token here"; //replace this
        
        try {
            URL myUrl = new URL("https://www.hw.com/students/Daily-Life/Cafeteria-Menu");
            HttpURLConnection connection = (HttpURLConnection) myUrl.openConnection();
            
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Cookie", "authentication=DNN; .DOTNETNUKE=" + token + ";");
            
            int status = connection.getResponseCode();
            
            if (status != 200) {
                System.out.println("Something went wrong, status: " + status);
                return;
            }
            
            // This is the same Scanner class that we use to read input from the keyboard, but instead of System.in as our input
            // stream, we're using the data the server sent us. Let's loop through it line-by-line and add each to a string.
            Scanner scanner = new Scanner(connection.getInputStream());
            String content = "";
            while (scanner.hasNext()) {
                content += scanner.nextLine() /* + "\n" */;
            }
            
            // To save memory, make sure to clean up.
            scanner.close();
            connection.disconnect();
            
            // If you're familiar with HTML, you know that each "element" has an opening tag, content, and a closing tag:
            // <p>I am a text element!</p>
            // (although some have no content: ) <br />
            
            // Let's find the <table> element on our webpage, which contains our cafeteria menu data. This will let us
            // ignore the extra stuff, like the webpage header and footer.          
            int tableStart = content.indexOf("<tbody>") + 7;
            int tableEnd = content.indexOf("</tbody>") - 1;
            String table = content.substring(tableStart, tableEnd);
            
            String result = "";
            for (int i = 0; i < 5; i++) {

                int tr1Start = table.indexOf("<tr style=\"background-color: #444; color:#f9f9f9;\">") + 53;
                int tr1End = table.indexOf("</tr>");
                
                if (tr1Start < 0 || tr1End < 0) {break;}
                String header = table.substring(tr1Start, tr1End);
                table = table.substring(tr1End + 5);

                int thStart = header.indexOf("<th>") + 4;
                int thEnd = header.indexOf("</th>");
                String day = header.substring(thStart, thEnd);

                int tr2Start = table.indexOf("<tr>") + 4;
                int tr2End = table.indexOf("</tr>");
                String data = table.substring(tr2Start, tr2End);
                table = table.substring(tr2End + 5);

                int tdStart = data.indexOf("<td>") + 4;
                int tdEnd = data.indexOf("</td>");
                String text = data.substring(tdStart, tdEnd);

                text = text.replaceAll("<p>", "");
                text = text.replaceAll("</p>", "");
                text = text.replaceAll("<strong>", "");
                text = text.replaceAll("</strong>", "");
                text = text.replaceAll("<br />", "\n");
                 
                result += "\n\n-------\n\nOn " + day + ", the cafeteria menu will be:\n" + text;
            }

            System.out.println(result);

        } catch (Exception e) {
            e.printStackTrace();
        }


        yoshiSquare(4);
    }

    public static void yoshiSquare () {
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

        Scanner keyboard = new Scanner(System.in);
        System.out.print("enter an yoshi: ");
        int inp = keyboard.nextInt(); 

        // checks if the person hates yoshi
        if (inp <= 0) {
            for (int i = 0; i < 79; i++) {System.out.println("you made yoshi sad. think about your actions");}
            System.out.print("you made yoshi sad. think about your actions");
            wait(10000);
            
            //clears screen
            System.out.print("\033[H\033[2J");
            System.out.flush();;
        } else {
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ yoshi zone begin ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            for (int i = 0; i < inp; i++) {    
               for (String l : yoshiLines) {
                   System.out.println(l + l + l + l + l);
               }
            }
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ yoshi zone end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
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