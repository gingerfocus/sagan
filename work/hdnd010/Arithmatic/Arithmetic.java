
import java.util.*;

public class Arithmetic {

	public static void main (String [] args) {
		String expression = "( 3 * ( ( ( 3 * 4 ) / -2 ) - -5 ) )"; //should be 5
		System.out.println(evaluate(expression));
	}

	//Evaluates a String exp that has an arithmetic expression, written in classic notation
	public static int evaluate(String exp) {
		String newExp = convertClassicToStout(exp);
		return evaluateStout(newExp);
	}
	
	//Returns the result of doing operand1 operation operand2,
	//e.g. operate(5, 2, "-") should return 3
	public static int operate(int operand1, int operand2, String operation) {
		if (operation.equals("+")) 
			return operand1 + operand2;
		else if (operation.equals("-"))
			return operand1 - operand2;
		else if (operation.equals("*"))
			return operand1 * operand2;
		else if (operation.equals("/"))
			return operand1 / operand2;
		else
			System.out.println("you fucked up");
		return 0;
	}
	
	//Evaluates a String exp that has an arithmetic expression written in STOUT notation
	public static int evaluateStout(String exp) {
		Stack theStack = new Stack();
		Scanner e = new Scanner (exp);

		while (e.hasNext()) {
			if (e.hasNextInt()) {
				theStack.push(e.nextInt());
			} else {
				int value2 = (int)theStack.pop();
				int value1 = (int)theStack.pop();
				theStack.push(operate(value1, value2, e.next()));
			}
		}

		e.close();

		return (int)theStack.pop();
		
	}
	
	public static String convertClassicToStout(String exp) {
		Stack operations = new Stack();
		Scanner e = new Scanner (exp);

		String retStr = "";

		while (e.hasNext()) {
			if (e.hasNextInt())
				retStr = retStr + " " + e.next();
			else {
				String chunk = e.next();
				if (isOperator(chunk)) {
					operations.push(chunk);
				} else if (chunk.equals(")")) {
					retStr = retStr + " " + operations.pop();
				}
			}		
		}

		e.close();

		return retStr;
	}

	private static boolean isOperator(String inp) {
		if (inp.equals("+") || inp.equals("-") || inp.equals("*") || inp.equals("/"))
			return true;
		return false;
	}	
}
