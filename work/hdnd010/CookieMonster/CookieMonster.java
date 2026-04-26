import java.util.ArrayDeque;
import java.util.PriorityQueue;
import java.util.*;
import java.io.File;


public class CookieMonster {

    private int [][] cookieGrid;
    private int numRows;
    private int numCols;

    //private int[][] buildBackGrid;

    //Constructs a CookieMonster from a file with format:
    //numRows numCols
    //<<rest of the grid, with spaces in between the numbers>>
    public CookieMonster(String fileName) {
        int row = 0;
        int col = 0;
        try {
            Scanner input = new Scanner(new File(fileName));
            numRows = input.nextInt(); 
            numCols = input.nextInt();
            cookieGrid = new int[numRows][numCols];
 
            for (row = 0; row < numRows; row++)
                for (col = 0; col < numCols; col++)
                        cookieGrid[row][col] = input.nextInt();
                                          
            input.close();
        } catch (Exception e) {
            System.out.print("Error creating maze: " + e.toString());
            System.out.println("Error occurred at row: " + row + ", col: " + col);
        }
    }

    public CookieMonster(int [][] cookieGrid) {
        this.cookieGrid = cookieGrid;
        this.numRows    = cookieGrid.length;
        this.numCols    = cookieGrid[0].length;
        //this.buildBackGrid = new int[numRows][numCols];
    }

    private boolean goodPoint(int row, int col) {
        return (row >= 0 && row < numRows && col >= 0 && col < numCols && cookieGrid[row][col] >= 0);
    }

    //real coding only
	public int recursiveCookies() {
		return recursiveOptimalPath(0, 0);
        //buildBack(numRows-1, numCols-1);
        //return buildBackGrid[0][0];
	}	

    /*
    //starts and ending point finds the absolute maximum of each point to store in memory to be called on later
    public void buildBack(int row, int col) {
        if (goodPoint(row, col)) {
            if ( (goodPoint(row, col+1) && goodPoint(row+1, col) && buildBackGrid[row][col+1] > buildBackGrid[row+1][col] ) || (!goodPoint(row+1, col) && goodPoint(row, col+1) ) )
                buildBackGrid[row][col] = cookieGrid[row][col] + buildBackGrid[row][col+1];
            else if ( (goodPoint(row, col+1) && goodPoint(row+1, col) ) || goodPoint(row+1, col) && !goodPoint(row, col+1)) 
                buildBackGrid[row][col] = cookieGrid[row][col] + buildBackGrid[row+1][col];
            else
                buildBackGrid[row][col] = -1;

            buildBack(row-1, col);
            if (goodPoint(row, col-1) && buildBackGrid[row][col-1] == 0)
                buildBack(row, col-1);
        }
    }
    */

    //gets the maximum value at a point and calls recursivly
    //either goes right or down (in order), and gets best result assuming that decision is optimal
	private int recursiveOptimalPath(int row, int col) {
        
        int bestFound = cookieGrid[row][col];
        int currentFound = -1;

        if (goodPoint(row, col + 1)) { //checking right
            currentFound = recursiveOptimalPath(row, col + 1) + cookieGrid[row][col];
            if (currentFound > bestFound) 
                bestFound = currentFound;
        }

        if (goodPoint(row + 1, col)) { //checking down
            currentFound = recursiveOptimalPath(row + 1, col) + cookieGrid[row][col];
            if (currentFound > bestFound) 
                bestFound = currentFound;
        }

        return bestFound;
	}

	//finds the most cookies using a queue always starting with the right path then down
    //bredth first search
    public int queueCookies() {
        ArrayDeque<PathMarker> queue = new ArrayDeque<PathMarker>();
        int mostCookiesSoFar = -1;
        queue.addFirst(new PathMarker(0, 0, 0));

        while(!queue.isEmpty()) {
            PathMarker cur = queue.removeLast();

            if (cur.total > mostCookiesSoFar) {
                mostCookiesSoFar = cur.total;
            }

            if (goodPoint(cur.row, cur.col+1)) { queue.addFirst(new PathMarker(cur.row, cur.col+1, cur.total + cookieGrid[cur.row][cur.col])); }
            if (goodPoint(cur.row+1, cur.col)) { queue.addFirst(new PathMarker(cur.row+1, cur.col, cur.total + cookieGrid[cur.row][cur.col])); }
        }

        return mostCookiesSoFar + cookieGrid[cookieGrid.length -1][cookieGrid[0].length -1];
    }

    //finds the most cookies using a stack always starting with the right path then down
    //depth first search
    public int stackCookies() {
        ArrayDeque<PathMarker> stack = new ArrayDeque<PathMarker>();
        int mostCookiesSoFar = -1;
        stack.addFirst(new PathMarker(0, 0, 0));

        while(!stack.isEmpty()) {
            PathMarker cur = stack.removeFirst();

            if (cur.total > mostCookiesSoFar) {
                mostCookiesSoFar = cur.total;
            }

            if (goodPoint(cur.row, cur.col+1)) { stack.addLast(new PathMarker(cur.row, cur.col+1, cur.total + cookieGrid[cur.row][cur.col])); }
            if (goodPoint(cur.row+1, cur.col)) { stack.addLast(new PathMarker(cur.row+1, cur.col, cur.total + cookieGrid[cur.row][cur.col])); }
        }

        return mostCookiesSoFar + cookieGrid[cookieGrid.length -1][cookieGrid[0].length -1];
    }

    /* Calculate which route grants the most cookies using a priority queue. */
    /* From any given position, always add the path right before adding the path down */
    public int pqCookies() {
        PriorityQueue<PathMarker> priorityQueue = new PriorityQueue<PathMarker>();
        int mostCookiesSoFar = -1;
        priorityQueue.add(new PathMarker(0, 0, 0));

        while(!priorityQueue.isEmpty()) {
            PathMarker cur = priorityQueue.poll();

            if (cur.total > mostCookiesSoFar) {
                mostCookiesSoFar = cur.total;
            }

            if (goodPoint(cur.row, cur.col+1)) { priorityQueue.add(new PathMarker(cur.row, cur.col+1, cur.total + cookieGrid[cur.row][cur.col])); }
            if (goodPoint(cur.row+1, cur.col)) { priorityQueue.add(new PathMarker(cur.row+1, cur.col, cur.total + cookieGrid[cur.row][cur.col])); }
        }

        return mostCookiesSoFar + cookieGrid[cookieGrid.length -1][cookieGrid[0].length -1];
    }
}
