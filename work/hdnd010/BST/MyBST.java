
import java.util.ArrayDeque;

public class MyBST {
	
	public BinaryNode root;  // holds the root of this BST

	// Constructor: creates an empty BST.
	public MyBST() {
		root = null;
	}

	public BinaryNode getRoot() {
		return root;
	}

	// Returns true if this BST contains value; otherwise returns false.
	public boolean contains(Comparable value) {
			BinaryNode cur = root;

			while (cur != null) {
            	if (cur.getValue().compareTo(value) == 0) {
            		return true;
            	} else if (cur.getValue().compareTo(value) > 0) {
            		if (cur.hasRight()) {
            			cur = cur.getRight();
            		} else {
            			return false;
            		}
            	} else {
            		if (cur.hasLeft()) {
            			cur = cur.getLeft();
            		} else {
            			return false;
            		}
            	}
        	}

    	return false;
	}

	// Adds value to this BST, unless this tree already holds value.
	// Returns true if value has been added; otherwise returns false.
	public boolean add(Comparable value) {		
		BinaryNode cur = root;

		while (cur != null) { 
			if (cur.getValue().compareTo(value) > 0) {
				if (cur.hasLeft()) {
					cur = cur.getLeft();
				} else {
					cur.setLeft(new BinaryNode(value));
					return true;
				}
			} else if (cur.getValue().compareTo(value) < 0) {
				if (cur.hasRight()) {
					cur = cur.getRight();
				} else {
					cur.setRight(new BinaryNode(value));
					return true;
				}
			} else {
				//element alreay exist in list
				return false;
			}
		}

		root = new BinaryNode(value); //when root is null this base case runs
		return true;
	}

	// Removes value from this BST.  Returns true if value has been
	// found and removed; otherwise returns false.
	public boolean remove(Comparable value) {
		if (root == null) {
			return false;
		} else {

			//find the object
			BinaryNode prev = root;
			BinaryNode cur = root;

			while (cur != null) {
				if (cur.getValue().compareTo(value) == 0) {
					//value found code continues here

					if (!cur.hasLeft() && !cur.hasRight()) { //has no childern
						if (cur.equals(prev)) {
							root = null;
						} else if (prev.hasLeft() && prev.getLeft().equals(cur)) {
							prev.setLeft(null);
						} else if (prev.hasRight() && prev.getRight().equals(cur)) {
							prev.setRight(null);
						}
						return true;
					} else if (cur.hasRight() && cur.hasLeft()) { //has both shitters
						
						//-----------------------------

						BinaryNode prevTemp = cur;
						BinaryNode temp = cur;
						temp = temp.getLeft(); //moving left once
						while (temp.hasRight()) { //mving right as much as you can
							prevTemp = temp;
							temp = temp.getRight();
						}

						if (prevTemp.getLeft().equals(temp)) { //there is nothing to the right of temp
							
							if (cur.equals(root)) {
								root = temp;
								temp.setRight(cur.getRight());
								return true;
							} else {
								if (prev.getRight() != null && prev.getRight().equals(cur)) {
									prev.setRight(temp);
								} else {
									prev.setLeft(temp);
								}
								temp.setRight(cur.getRight());
								return true;
							}

						} else {

							BinaryNode added = temp.getLeft(); //this can be null

							//move temp to where cur is 
						
							if (prev.equals(cur)) { //you are removing the root
							
								if (temp.equals(prevTemp)) { //never moved right
									root = temp;
									temp.setRight(cur.getRight());
									temp.setLeft(temp.getLeft());//this is sketchy
								} else {
									root = temp;
									temp.setLeft(cur.getLeft());
									temp.setRight(cur.getRight());
								}
							} else if (prev.hasRight() && prev.getRight().equals(cur)) { //cur is to the right
								prev.setRight(temp);
								temp.setLeft(cur.getLeft()); //these are all ok with null
								temp.setRight(cur.getRight());
							} else { //cur is to the left
								prev.setLeft(temp);
								temp.setLeft(cur.getLeft()); //these are all ok with null
								temp.setRight(cur.getRight());
							}						
							
							prevTemp.setRight(added); //this meathod is ok with adding null

							return true;

						}
						

						//-----------------------------

					} else { //has one shitter
						if (prev.hasRight() && prev.getRight().equals(cur)) {
							if (cur.hasRight()) {
								prev.setRight(cur.getRight());
							} else {
								prev.setRight(cur.getLeft());
							}
						} else {
							if (cur.hasRight()) {
								prev.setLeft(cur.getRight());
							} else {
								prev.setLeft(cur.getLeft());
							}
						}

						return true;

					}
				} else if (cur.getValue().compareTo(value) > 0) {
					if (cur.hasLeft()) {
						prev = cur;
						cur = cur.getLeft();
					} else {
						return false;
						//value not in tree
					}
				} else {
					if (cur.hasRight()) {
						prev = cur;
						cur = cur.getRight();
					} else {
						return false;
						//value not in tree
					}
				}
			}

			return false;
		}
	}


	//to String, but in order
	public String toString() {
		if (root == null) {
			return "[]";
		} else {
			String dumbThing = toStringRec(root);
			return "[" + dumbThing.substring(0, dumbThing.length() - 2) + "]";
		}
	}

	private String toStringRec (BinaryNode cur) {
		if (cur == null) { return ""; }
		else { return toStringRec(cur.getLeft()) + cur.getValue() + ", " + toStringRec(cur.getRight()); }
	}

	public static void main (String [] args) {
		MyBST a = new MyBST();

		
		/*
		a.add(3);
		a.add(4);
		a.add(2);
		a.add(1);
		a.add(7);
		a.add(6);

		a.add(3); //code skips this one
		*/

		a.add("g"); a.add("a"); a.add("l"); a.add("c"); a.add("r"); a.add("b"); a.add("sg"); a.add("aa"); a.add("d"); a.add("g"); a.add("rr"); a.add("e");

		System.out.println(a);

		a.remove("k"); a.remove("as"); a.remove("d");

		System.out.println(a);

		//NEED TO CHECK FOR STRINGS

	}

}





























