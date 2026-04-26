public class SinglyLinkedList {
	//declaring dumb objects
	private ListNode head;
	private ListNode tail;
	private int nodeCount;

	//does constructing things kindof like a constructor class in java
	public SinglyLinkedList() {
		head = null;
		tail = null;
		nodeCount = 0;
	}

	//supposedly hard construtor that make me feel sad beacuse of its existance
	//all elements of array added in same order
	public SinglyLinkedList(Object[] values) {
		new SinglyLinkedList();
		for (Object obj : values) {
			add(obj);
		}
	}
	
	//meathods the are for testing
	public ListNode getHead() {return head;}
	public ListNode getTail() {return tail;}

	//list empty? good! list not emptry? Bad :(
	public boolean isEmpty() {
		if (nodeCount == 0) {return true;}
		else {return false;}
	}

	//returns the node count
	public int size() {return nodeCount;}

	//returns true if the object has object in it, otherwise false
	public boolean contains(Object obj) {
		for (ListNode n = head; n != null; n = n.getNext()) {
			if ( (n.getValue() != null && n.getValue().equals(obj) ) || n.getValue() == obj) {return true;}
		}
		return false;
	}

	//returns index of object, if it is not there give -1
	public int indexOf(Object obj) {
		int index = 0;
		for (ListNode n = head; n != null; n =  n.getNext()) {
			Object nValue = n.getValue();
			if ((nValue != null && nValue.equals(obj) ) || nValue == obj) {return index;}
			else{index++;}
		}
		return -1;
	}

	//adds object to array, retrun true if the program is winning and false if it is not
	public boolean add(Object obj) {
		if (isEmpty()) {
			tail = new ListNode (obj);
			head = tail;
		}
		else {
			tail.setNext(new ListNode (obj));
			tail = tail.getNext();
		}
		nodeCount++;
		return true;
	}

	// Removes the first element that is equal to obj, if any.
	// Returns true if successful; otherwise returns false.
	public boolean remove(Object obj) {
		if (isEmpty()) {return false;}
		else if (nodeCount == 1) {
			if ( (head.getValue() != null && head.getValue().equals(obj) ) || head.getValue() == obj) {
				head = null;
				tail = null;
				nodeCount--;
				return true;
			}
		} else {
			ListNode nodeLast = head;
			for (ListNode n = head; n != null; n = n.getNext()) {
				Object nValue = n.getValue();
				if ( (nValue != null && nValue.equals(obj) ) || nValue == obj) {
					if (n.equals(head)) {
						head = n.getNext();
					} else {
						nodeLast.setNext(n.getNext()); //this works for tail beacuse it sets next to null like it is supposed to be
						if (n.equals(tail)) {tail = nodeLast;}
						
					}
					nodeCount--;
					return true;
				}
				nodeLast = n;
			}
		}
		return false;
	}

	//returns element at index i               
	public Object get(int i) {
		if (i < 0 || i >= nodeCount) {throw new IndexOutOfBoundsException ("Index " + i + " is out of bounds for size " + nodeCount);}
		else {
			int counter = 0;
			for (ListNode n = head; n != null; n = n.getNext()) {
				if (counter == i) {return n.getValue();}
				else {counter++;}
			}
		}
		throw new IndexOutOfBoundsException ("Something went wrong in my end, my bad");
	}

	//replace the dumb object with the new cooler, radder object and returns the old dumb value for people to use for dumb stuff.
	public Object set(int i, Object obj) {
		if ( (i < 0 || i >= nodeCount)) { // || (nodeCount == 0 && i == 0) //check that this does everything it is supposed to
			throw new IndexOutOfBoundsException("Index " + i + " is out of bounds for size " + nodeCount);
		}
		else {
			int counter = 0;
			for (ListNode n = head; n != null; n = n.getNext()) {
				if (counter == i) {
					Object retValue = n.getValue();
					n.setValue(obj);
					return retValue;
				}
				else {counter++;}
			}
		}
		return null;//uh-oh
	}



	//THIS MEATHOD DOES NOT WORK !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	// Inserts obj to become the i-th element. Increments the size
	// of the list by one.
	public void add(int i, Object obj) {
		if (i < 0 || i > nodeCount) {
			throw new IndexOutOfBoundsException ("Index " + i + " is out of bounds for size " + nodeCount);
		} else if (isEmpty()){
			head = new ListNode (obj);
			tail = head;
			nodeCount++;
		} else if (i == 0) {
			head = new ListNode (obj, head);
			nodeCount++;
		} else if (i == nodeCount) {
			tail.setNext(new ListNode (obj));
			tail = tail.getNext();
			nodeCount++;
		} else {
			int counter = 1;
			ListNode nodeLast = head;
			for (ListNode n = head.getNext(); n != null; n = n.getNext()) {
				if (counter == i) {
					nodeLast.setNext(new ListNode (obj, n));
					counter++;
				}
				else {
					counter++;
					nodeLast = n;
				}
			}
			nodeCount++;
		}
		// {0, 1, 3, 2}
	}

	// Removes the i-th element and returns its value.
	// Decrements the size of the list by one.
	public Object remove(int i) {
		if (i < 0 || i > nodeCount) {
			throw new IndexOutOfBoundsException ("Index " + i + " is out of bounds for size " + nodeCount);
		} else if (nodeCount == 1) {
			Object retValue = head.getValue();
			head = null;
			tail = null;
			nodeCount--;
			return retValue;
		} else if (i == 0) {
			Object retValue = head.getValue();
			head = head.getNext();
			nodeCount--;
			return retValue;
		} else {
			int counter = 0;
			ListNode nodeLast = head;
			for (ListNode n = head; n != null; n = n.getNext()) {
				if (counter == i) {
					nodeLast.setNext(n.getNext());
					if (i == nodeCount) {tail = nodeLast;} //updateing tail if it needs it
					nodeCount--;
					return n;
				} else {
					counter++;
					nodeLast = n;
				}
			} 
		}
		throw new IndexOutOfBoundsException ("Something went wrong in my end, my bad");
	}

	//makes a string of the array, epic style
	public String toString() {
        String returnWord = "[";
        if (isEmpty()) {
            returnWord += "]";
            return returnWord;
        } else {
            returnWord += head.getValue();

            for (ListNode n = head.getNext(); n != null; n =  n.getNext()) {
            	returnWord += ", ";
                returnWord += n.getValue();
            }
            returnWord += "]";
            return returnWord;
        }
	}

	public static void main (String [] args) {
		System.out.println("------------------------------Checks-------------------------------");
	
		int correctTests = 0;
		String[] array = new String[] {"Object0", "Object1", "Object2", "Object3", "Object4", "Object5", "Object6", "Object7", "Object8", "Object9"};

		//---------------------constructor---------------------
		System.out.print(" - Checking SinglyLinkedList() ... ");
		
		SinglyLinkedList a = new SinglyLinkedList();
		
		try {
			a.get(0);
			System.out.println("fail");
		} catch (Exception e) {
			System.out.println("pass");
			correctTests++;
		}

		//---------------constructor from array----------------
		System.out.print(" - Checking SinglyLinkedList(Object[] value) ... ");
		SinglyLinkedList b = new SinglyLinkedList(array);

		if (b.get(0).equals("Object0") && b.get(1).equals("Object1") && b.get(9).equals("Object9")){
			System.out.println("pass");
			correctTests++;
		} else {
			System.out.println("fail");
		}

		//check if first object in input array is null
		
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

		//check if the array has null in it

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

		SinglyLinkedList c = new SinglyLinkedList();

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
		

		//needs more tests

		if (c.remove(0).equals("Object0") && c.isEmpty()) {
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

		//------------------------------------------------------

		System.out.println(correctTests + " out of 12 meathods are working without error");
	}
}