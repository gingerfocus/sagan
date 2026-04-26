public class CircularDoublyLinkedList {
	//variables for doing things
	private int nodeCount;
	private ListNode2 sentinel;

	//does the constructing of the object that will be the cause of my grief for the next week
	public CircularDoublyLinkedList() {
		sentinel = new ListNode2 (null); //THIS IS STUPID
		sentinel.setNext(sentinel);
		sentinel.setPrevious(sentinel);
		nodeCount = 0;
	}

	//the exact same code as in the previous project, line for line
	public CircularDoublyLinkedList(Object[] values) {
		sentinel = new ListNode2 (null); //THIS IS STUPID
		sentinel.setNext(sentinel);
		sentinel.setPrevious(sentinel);
		nodeCount = 0;
		for (Object obj : values) {
			add(obj);
		}
	}
	
	//thing that does the returning of the head
	public ListNode2 getHead() {
		if (isEmpty()) {
			return null;
		} else {
			return sentinel.getNext();
		}
	}

	//this meathod tells you if the list is empty
	public boolean isEmpty() {
		if (nodeCount == 0) {return true;} 
		else {return false;}
	}

	//returns the variable nodeCount which is the number of nodes in the list of the size
	public int size() {
		return nodeCount;
	}

	//returns true if the list has obj in it, false otherwise
	public boolean contains(Object obj) {
		if (isEmpty()) {return false;} 
		else {
			for (ListNode2 n = getHead(); !compareThings(n, sentinel); n = n.getNext()) {
				if (compareThings(obj, n.getValue())) {
					return true;
				}
			}
			return false;
		}	
	}

	//return index of obj, if not found returns -1
	public int indexOf(Object obj) {
		int count = 0;
		for (ListNode2 n = sentinel.getNext(); !n.equals(sentinel); n = n.getNext()) {
			if (compareThings(obj, n.getValue())) {
				return count;
			} else {
				count++;
			}
		}
		return -1;
	}




	// Adds obj to this collection.  Returns true if successful;
	// otherwise returns false.
	public boolean add(Object obj) {
		ListNode2 last = sentinel.getPrevious(); //THIS DOESNT WORK

		last.setNext(new ListNode2(obj, last, sentinel));
		sentinel.setPrevious(last.getNext());

		if (getHead() == sentinel) {
			sentinel.setNext(sentinel.getPrevious());
		}
		nodeCount++;

		return true;
	}

	//removes first instance of obj, returns true if it works, false if it fails
	public boolean remove(Object obj) {
		ListNode2 nodeLast = sentinel;
		for (ListNode2 n = sentinel.getNext(); !n.equals(sentinel); n = n.getNext()) {
			if (compareThings(obj, n.getValue())) {
				nodeLast.setNext(n.getNext());
				n.getNext().setPrevious(nodeLast);
				nodeCount--;
				return true;
			} else {
				nodeLast = n;
			}
		}
		return false;
	}

	// Returns the i-th element.               
	public Object get(int i) {
		if (i < 0 || i >= nodeCount) {
			throw new IndexOutOfBoundsException("dont be so bad anymore stupid");
		} else {
			int count = 0;
			for (ListNode2 n = getHead(); !n.equals(sentinel); n = n.getNext()) {
				if (count == i) {
					return n.getValue();
				}
				count++;
			}
		}
		throw new IndexOutOfBoundsException("something went wrong");
	}

	// Replaces the i-th element with obj and returns the old value.
	public Object set(int i, Object obj) {
		if (i < 0 || i > nodeCount) {
			throw new IndexOutOfBoundsException ("cringe");
		} else {
			int count = 0;
			for (ListNode2 n = sentinel.getNext(); !n.equals(sentinel); n = n.getNext()) {
				if (count == i) {
					Object retValue = n.getValue();
					n.setValue(obj);
					return retValue;
				} else {
					count++;
				}
			}
		}
		throw new IndexOutOfBoundsException ("cringe");
	}

	// Inserts obj to become the i-th element. Increments the size of the list by one.
	public void add(int i, Object obj) {
		if (i < 0 || i > nodeCount) {
			throw new IndexOutOfBoundsException ("cringe");
		} else if (isEmpty()) {
			if (i == 0) {
				sentinel.setNext(new ListNode2 (obj, sentinel, sentinel));
				sentinel.setPrevious(sentinel.getNext());
				nodeCount++;
			} else {
				throw new IndexOutOfBoundsException ("cringe");
			}
		} else {
			ListNode2 nodeLast = sentinel;
			int count = 0;
			for (ListNode2 n = getHead(); !n.equals(sentinel) ; n = n.getNext()) {
				if (count == i) {
					nodeLast.setNext(new ListNode2 (obj, nodeLast, n));
					n.setPrevious(nodeLast.getNext());
					nodeCount++;
					count++;
				} else {
					nodeLast = n;
					count++;
				}
			}
		}
	}

	// Removes the i-th element and returns its value.
	// Decrements the size of the list by one.
	public Object remove(int i) {
		if (i < 0 || i > nodeCount) {
			throw new IndexOutOfBoundsException ("cringe");
		} else {
			ListNode2 nodeLast = sentinel;
			int count = 0;
			for (ListNode2 n = sentinel.getNext(); !n.equals(sentinel); n = n.getNext()) {
				if (count == i) {
					Object retValue = n.getValue();
					nodeLast.setNext(n.getNext());
					n.getNext().setPrevious(nodeLast);
					nodeCount--;
					return retValue;
				} else {
					nodeLast = n;
					count++;
				}
			}
		}
		throw new IndexOutOfBoundsException ("cringe");
	}

	// Returns a string representation of this list exactly like that for MyArrayList.
	public String toString() {
		String returnWord = "[";
        if (isEmpty()) {
            returnWord += "]";
            return returnWord;
        } else {
        	returnWord += getHead().getValue();
            for (ListNode2 n = getHead().getNext(); !n.equals(sentinel); n = n.getNext()) {
            	returnWord += ", ";
                returnWord += n.getValue();
            }
            returnWord += "]";
            return returnWord;
        }
	}

	public String reveseToString() {
		String returnWord = "[";
        if (isEmpty()) {
            returnWord += "]";
            return returnWord;
        } else {
        	returnWord += sentinel.getPrevious().getValue();
            for (ListNode2 n = sentinel.getPrevious().getPrevious(); !n.equals(sentinel); n = n.getPrevious()) {
            	returnWord += ", ";
                returnWord += n.getValue();
            }
            returnWord += "]";
            return returnWord;
        }
	}
	
	// Like question 7 on the CircularDoublyLinkedList test:
	// Add a "segment" (another list) onto the end of this list
	public void addSegmentToEnd(CircularDoublyLinkedList seg) {
		/*
		if (!seg.isEmpty()) {
			//linking them together
			sentinel.getPrevious().setNext(seg.getHead());
			seg.getHead().setPrevious(sentinel.getPrevious());

			//linking them in a circle
			ListNode2 segLast = seg.getHead().getPrevious().getPrevious();
			segLast.setNext(this.sentinel);
			this.sentinel.setPrevious(segLast);

			nodeCount = nodeCount + seg.size();
		}
		*/
	}
	
	// Like question 8 on the CircularDoublyLinkedList test:
	// You are to remove the next 16 nodes from the list, after the node nodeBefore.
	// (on the test these nodes were assumed to contain CCCCCCCCGGGGGGGG, but here
	// you do not need to assume or check for that)
	public void removeCCCCCCCCGGGGGGGG(ListNode2 nodeBefore) {
		ListNode2 nodeEnd = nodeBefore;
		for (int i = 0; i < 16; i++) {
			nodeEnd = nodeEnd.getNext();
		}

		nodeBefore.setNext(nodeEnd);
		nodeEnd.setPrevious(nodeBefore);		
	}
	
	// Like question 9 on the CircularDoublyLinkedList test:
	// You are to find and delete the first instance of seg in the list.
	// If seg is not in the list, return false, otherwise return true.
	public boolean deleteSegment(CircularDoublyLinkedList seg) {
		
		int count = 0;
		for (ListNode2 n = getHead(); !n.equals(sentinel); n = n.getNext()) {
			if (count > nodeCount - seg.size()) {
				return false;
			} else {
				int segCount = 0;
				return true; //NEEDS WORK
			}
		}

		return false;
	}
	
	// Like question 10 on the CircularDoublyLinkedList test:
	// Delete the last three nodes in the list
	// If there are not enough nodes, return false
	public boolean deleteLastThree() {
		if (nodeCount < 3) {return false;}
		else {
			ListNode2 n = sentinel;
			for (int i = 0; i < nodeCount - 3; i++) {
				n = n.getNext();
			}
			n.setNext(sentinel);
			sentinel.setPrevious(n);
			return true;
		}
	}

	// Like question 11 on the CircularDoublyLinkedList test:
	// Replaces every node containing "A" with three nodes containing "T" "A" "C"
	public void replaceEveryAWithTAC() {
		/*
		ListNode2 nodeLast = sentinel;
		for (ListNode2 n = getHead(); !n.equals(sentinel); n.getNext()) {
			if (n.getValue().equals("A")) {
				nodeLast.setNext(new ListNode2 ("T", nodeLast, n));
				n.setPrevious(nodeLast.getNext());

				n.setNext(new ListNode2 ("C", n, n.getNext()));
				n.getNext().getNext().setPrevious(n.getNext());
			}
			nodeLast = n; //minor optimizations here can be to not run to programe for the next C
		}
		*/
	}


	private boolean compareThings(Object obj, Object comparing) {
		if (obj == null) {
			if (obj == comparing) {return true;}
			else {return false;}
		} else {
			if (obj.equals(comparing)) {return true;}
			else {return false;}
		}
	}



	//---------------------------------------main meathod---------------------------------------------------------

	public static void main (String [] args) {		
		System.out.println("------------------------------Checks-------------------------------");
	
		int correctTests = 0;
		String[] array = new String[] {"Object0", "Object1", "Object2", "Object3", "Object4", "Object5", "Object6", "Object7", "Object8", "Object9"};

		//---------------------constructor---------------------
		System.out.print(" - Checking CircularDoublyLinkedList() ... ");

		CircularDoublyLinkedList a = new CircularDoublyLinkedList();
		
		if (a.isEmpty()){
			try {
				a.get(0);
				System.out.println("fail");
			} catch (Exception e) {
				System.out.println("pass");
				correctTests++;
			}
		} else {
			System.out.println("fail");
		}

		//---------------constructor from array----------------
		System.out.print(" - Checking CircularDoublyLinkedList(Object[] value) ... ");

		CircularDoublyLinkedList b = new CircularDoublyLinkedList(array);

		if (b.get(0).equals("Object0") && b.get(1).equals("Object1") && b.get(9).equals("Object9")){
			System.out.println("pass");
			correctTests++;
		} else {
			System.out.println("fail");
		}

		//----------------------isEmpty()----------------------
		System.out.print(" - Checking isEmpty() ... ");
		
		if (a.isEmpty() && !b.isEmpty()) {
			System.out.println("pass");
			correctTests++;
		} else {
			System.out.println("fail");
		}

		//----------------------size()-------------------------
		System.out.print(" - Checking size() ... ");

		if (a.size() == 0 && b.size() == 10) { //supposed to be 10 as it counts from 1 like a human
			System.out.println("pass");
			correctTests++;
		} else {
			System.out.println("fail");
		}

		//---------------------contains(obj)---------------------
		System.out.print(" - Checking contains() ... ");

		if (!a.contains("Object0") && !a.contains(null) && !b.contains(null) && b.contains("Object0") && b.contains("Object9")) {
			System.out.println("pass");
			correctTests++;
		} else {
			System.out.println("fail");
		}

		//---------------------indexOf(obj)---------------------
		System.out.print(" - Checking indexOf(obj) ... ");
		
		if (a.indexOf(null) == -1 && b.indexOf("Object0") == 0 && b.indexOf("Object9") == 9 && b.indexOf("Object6") != 3) {
			System.out.println("pass");
			correctTests++;
		} else {
			System.out.println("fail");
		}

		//check if the meathod tryis to return null

		//---------------------add(obj)---------------------
		System.out.print(" - Checking add(obj) ... ");

		b.add("Object10");
		b.add(null);
		

		if (a.add(null) && b.get(0).equals("Object0") && b.get(10).equals("Object10") && b.get(11) == null && a.get(0) == null) {
			System.out.println("pass");
			correctTests++;
		} else {
			System.out.println("fail");
		}

		//---------------------remove(obj)---------------------
		System.out.print(" - Checking remove(obj) ... ");

		b.remove("Object0");
		b.remove(null);
		b.remove("not in list");
		a.remove(null);
		a.remove(null);

		if (b.get(0).equals("Object1") && b.get(9).equals("Object10")) {
			try {
				b.get(11);
				System.out.println("fail");
			} catch (Exception e) {
				System.out.println("pass");
				correctTests++;
			}
		} else {
			System.out.println("fail");
		}

		//---------------------get(index)---------------------
		System.out.print(" - Checking get(index) ... ");

		try {
			b.get(10);
			a.get(0); //swap these to check they both break
			System.out.println("fail");
		} catch (Exception e) {

			System.out.println("pass");
			correctTests++;
		}

		//---------------------set(index, obj)---------------------
		System.out.print(" - Checking set(index, obj) ... ");

		//resetiing from last meathod
		b.add(0, "Object0");

		b.set(0, "Changed0");
		b.set(10, "Changed10");

		if (b.get(0).equals("Changed0") && b.get(10).equals("Changed10")) {
			try {
				a.set(0, "oh-no"); //this isnt throwing out of bounds and is adding instead
				System.out.println("fail");
			} catch (Exception e) {
				System.out.println("pass");
				correctTests++;
			}
		} else {
			System.out.println("fail");
		}

		//-----------------add(index, obj)--------------------
		System.out.print(" - Checking add(index, obj) ... ");

		CircularDoublyLinkedList c = new CircularDoublyLinkedList();

		c.add(0, null);
		c.add(null);
		c.add(1, "Object0");

		if (c.get(2) == null && c.get(1) == null) {
			try {
				c.add(-1, "oh-no"); 
				System.out.println("fail");
			} catch (Exception e) {
				System.out.println("pass");
				correctTests++;
			}
		} else {
			System.out.println("fail");
		}

		//--------------------remove(index)---------------------
		System.out.print(" - Checking remove(index) ... ");

		c.remove(1);
		c.remove(1);
		

		//needs more tests

		if (c.remove(0) == null && c.isEmpty()) {
			try {
				c.remove(-1);
				System.out.println("fail");
			} catch (Exception e) {
				System.out.println("pass");
				correctTests++;
			}
		} else {
			System.out.println("fail");
		}

		

		//--------------------addSegmentToEnd(List seg)---------------------
		

		System.out.print(" - Checking addSegmentToEnd(List seg) ... ");

		c.add("A");
		b.addSegmentToEnd(c);

		System.out.println(b.reveseToString());

		if (b.get(10).equals(3)) {
			System.out.println("pass");
			correctTests++;
		} else {
			System.out.println("fail");	
		}


		System.out.print(" - Checking replaceEveryAWithTAC() ... ");


		c.add("T");
		c.add("a");
		c.add("A");
		c.add("A");

		System.out.println(c);

		c.replaceEveryAWithTAC();
		System.out.println(c);

		//------------------------------------------------------

		System.out.println(correctTests + " out of 12 meathods are working without error");

	}

}
