
import java.util.*;

public class Stack<E> {
	private LinkedList stack;

	public Stack() {
		stack = new LinkedList();
	}
	
	public void push(E obj) {
		stack.add(obj);
	}
	
	public E pop() {
		return (E)stack.remove(stack.size() - 1);
	}
	
	public E peek() {
		return (E)stack.get(stack.size() - 1);
	}
	
	public boolean isEmpty() {
		return stack.isEmpty();
	}
}
