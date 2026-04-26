// Implements a singly-linked list.

public class MyHashSet {
	private ListNode[] buckets;
	private int objectCount;
	private double loadFactorLimit;

	// Constructor: creates an empty hash set with default parameters
	public MyHashSet() {
		this.buckets = new ListNode[10];
		this.objectCount = 0;
		this.loadFactorLimit = 0.75;
	}

	// Constructor: creates a hash set with the given initial bucket size and load factor limit
	public MyHashSet(int bucketCount, double loadFactorLimit) {
		this.buckets = new ListNode[bucketCount];
		this.objectCount = 0;
		this.loadFactorLimit = loadFactorLimit;
	}

	// Return a pointer to the bucket array
	public ListNode[] getBuckets() {
		return this.buckets;
	}

	// Returns true if this set is empty; otherwise returns false.
	public boolean isEmpty() {
		return (objectCount == 0);
	}

	// Returns the number of elements in this set.
	public int size() {
		return objectCount;
	}
	
	// Return the bucket index for the object
	public int whichBucket(Object obj) {
		return (0x7FFFFFFF & obj.hashCode()) % this.buckets.length;
	}

	// Returns the current load factor (objCount / buckets)
	public double currentLoadFactor() {
		return (double)objectCount / buckets.length;
	}


	// Return true if the object exists in the set, otherwise false.
	// Use the .equals method to check equality.
	public boolean contains(Object obj) {
		int hash = whichBucket(obj);
		ListNode head = buckets[hash];
		for (ListNode node = head; node != null; node = node.getNext()) {
			if (node.getValue().equals(obj)) {
				return true;
			}
		}
		return false;
	}

	// Add an object to the set.
	// If the object already exists in the set you should *not* add another.
	// Return true if the object was added; false if the object already exists.
	// If an item should be added, add it to the beginning of the bucket.
	// After adding the element, check if the load factor is greater than the limit.
	// - If so, you must call rehash with double the current bucket size.
	public boolean add(Object obj) {
		int hash = whichBucket(obj);
		ListNode head = buckets[hash];

		try {
			//check if it is already in
			for (ListNode node = head; node != null; node = node.getNext()) {
				if (node.getValue().equals(obj)) {
					return false;
				}
			}

			buckets[hash] = new ListNode(obj, head);
			objectCount++;

			if (currentLoadFactor() > loadFactorLimit) {
				rehash(buckets.length * 2);
			}

			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}

	// Remove the object.  Return true if successful, false if the object did not exist
	public boolean remove(Object obj) {
		int hash = whichBucket(obj);
		ListNode head = buckets[hash];

		ListNode prev = null;

		for (ListNode node = head; node != null; node = node.getNext()) {
			if (node.getValue().equals(obj)) {
				if (prev == null) {
					//it is at the head
					buckets[hash] = node.getNext(); //this can be null
					objectCount--;
					return true;
				} else {
					prev.setNext(node.getNext());
					objectCount--;
					return true;
				}
			}
			prev = node;
		}
		return false;
	}

	// Rehash the set so that it contains the given number of buckets
	// Loop through all existing buckets, from 0 to length
	// rehash each object into the new bucket array in the order they appear on the original chain.
	public void rehash(int newBucketCount) {
		ListNode[] oldBuckets = buckets;
		buckets = new ListNode[newBucketCount];

		objectCount = 0;

		for (ListNode head : oldBuckets) {
			for (ListNode node = head; node != null; node = node.getNext()) {
				add(node.getValue());
			}
		}

	}

	// The output should be in the following format:
	// [ #1, #2 | { b#: v1 v2 v3 } { b#: v1 v2 } ]
	// #1 is the objCount
	// #2 is the number of buckets
	// For each bucket that contains objects, create a substring that indicates the bucket index
	// And list all of the items in the bucket (in the order they appear)
	public String toString() {
		String retString = "[ " + objectCount + ", " + buckets.length + " | ";

		for (int i = 0; i < buckets.length; i++) {
			ListNode head = buckets[i];
			
			if (head != null) {
				String bucketSubString = "{ b" + i + ": ";
				for (ListNode node = head; node != null; node = node.getNext()) {
					bucketSubString = bucketSubString + node.getValue() + " ";
				}
			
				bucketSubString = bucketSubString.substring(0, bucketSubString.length() - 1);
				bucketSubString += " }";
				retString = retString + bucketSubString + " ";
			}
		}

		
		retString = retString.substring(0, retString.length() - 1);


		retString += " ]";

		return retString;
	}


//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

	public static void main(String [] args) {
		
		MyHashSet a = new MyHashSet();
		
		System.out.println(a);

		a.add("01");
		a.add("02");
		a.add("03");
		a.add("04");
		a.add("05");
		a.add("06");
		a.add("07");
		a.add("08");
		a.add("09");
		a.add("10");
		a.add("11");
		a.add("12");
		a.add("13");
		a.add("14");

		System.out.println(a);

		a.remove("03");
		a.remove("06");
		a.remove("09");
		a.remove("12");
		a.remove("15");

		System.out.println(a);

		if (a.contains("01")) System.out.println("W1");
		if (!a.contains("03")) System.out.println("W2");
		if (!a.contains("20")) System.out.println("W3");

	}
}











