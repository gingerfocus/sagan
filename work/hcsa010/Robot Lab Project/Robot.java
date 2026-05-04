public class Robot
{
    private int[] hall;
    private int pos;             // current position (tile number) of Robot
    private boolean facingRight; // true means this Robot is facing right
    
    public Robot (int[] newHall, int robotPos) {
        hall = newHall;
        pos = robotPos;
    }

    // postcondition: returns true if this robot has a wall immediately in
    //                front of it, so it cannot move forward;
    //                otherwise, returns false
    private boolean forwardMoveBlocked()
    { 
        if ((pos == 0 && facingRight == false) || (pos == hall.length && facingRight ==true))
            return true;
        return false;
    }

    // postcondition: one move has been made according to the
    //                specifications above and the state of this
    //                Robot has been updated
    private void move()
    {
        if (this.forwardMoveBlocked()) {
            if (facingRight)
                pos++;
            else 
                pos--;
            if (hall[pos] > 0)
                hall[pos]--;
        }        
    }

    // postcondition: no more items remain in the hallway;
    //                returns the number of moves made
    public int clearHall()
    { 
        int moves = 0;
        while (!hallIsClear())
        {
            if (this.forwardMoveBlocked()) {
                if (facingRight)
                    facingRight = false;
                if (!facingRight)
                    facingRight = true;
            } else {
                move();
                moves++;
            }                
        }
        return moves;
    }

    // postcondition: returns true if the hallway contains no items;
    //                otherwise, returns false
    private boolean hallIsClear()
    { 
        int count = 0;
        for(int k = 0; k < hall.length; k++)
            count += hall[k];
        return (count == 0);
    }

    private void displayState()
    {
        for(int k = 0; k < hall.length; k++)
            System.out.print(" " + hall[k]);
        System.out.println();

        for(int k = 0; k < pos; k++)
            System.out.print("  ");

        if(facingRight)
            System.out.println(" >");
        else
            System.out.println(" <");
    }
}

public class RobotDriver{
    public static void main(String[] args)
    {
        int[] hall = {1, 1, 2, 2};
        Robot robby = new Robot(hall, 1);

        System.out.println(robby.clearHall());  
    }
}
