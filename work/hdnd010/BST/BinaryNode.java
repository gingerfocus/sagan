
public class BinaryNode {

	private Comparable value;
	private BinaryNode left;
	private BinaryNode right;
	
	public BinaryNode(Comparable value) {
		this.value = value;
		this.left = null;
		this.right = null;
	}
	
	public Comparable getValue() { return value; }
	public void setValue(Comparable value) { this.value = value; }

	public BinaryNode getLeft() { return left; }
	public void setLeft(BinaryNode left) { this.left = left; }

	public boolean hasLeft() { return left != null; }
	public boolean hasRight() { return right != null; }

	public BinaryNode getRight() {
		return right;
	}

	public void setRight(BinaryNode right) {
		this.right = right;
	}
	
	public boolean hasChildren() {
		return left != null || right != null;
	}

	public String toString() {
		return value.toString();
		
	}
	
}
