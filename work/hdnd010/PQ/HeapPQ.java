public interface MyPriorityQueue<E extends Comparable<E>> {

	//Adds obj to the Priority Queue
	public void add(E obj);
	
	//Removes and returns the MINIMUM element from the Priority Queue
	public E removeMin();
	
	//Returns the MINIMUM element from the Priority Queue without removing it
	public E peek();
	
	// Returns true if the priority queue is empty
	public boolean isEmpty();
	
	//Returns the number of elements in the priority queue
	public int size();
}

public class HeapPQ<E extends Comparable<E>> implements MyPriorityQueue<E> {

	public E[] heap;
	public int objectCount;
	private int startIndex;
	
	//this constructs the constructable heap to make an unstopable dumb thing to win the gold medel in the olympics
	public HeapPQ() {
        this.heap = (E[])new Comparable[3];
        this.startIndex = 0;
        this.objectCount = startIndex;
    }

    //this meathod does stuff to make the program work
	public void add(E obj) {
		insureCapacity();	
		heap[objectCount] = obj;
		bubbleUp(objectCount);
		objectCount++;
	}
	
	//gets rid of the top of the tree
	public E removeMin() {
		if (isEmpty()) {
			throw new IndexOutOfBoundsException();
		} else {
			E retValue = heap[startIndex];
			heap[startIndex] = heap[objectCount-1];
			objectCount--;
			bubbleDown(startIndex);
			return retValue;
		}
	}
	
	//returns index 1, or lowest thing in array
	public E peek() {
		if (isEmpty()) {
			throw new IndexOutOfBoundsException();
		} else {
			return heap[startIndex];
		}
	}
	
	//is the array empty?
	public boolean isEmpty() {
		return objectCount <= startIndex;
	}
	
	//gives the stupid usewr the object count variable beacsue they cant get it themslef, loser
	public int size() {
		return objectCount;
	}
	
	//dumb code that does the dumb things!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	public String toString() {
		StringBuffer stringbuf = new StringBuffer("[");
		for (int i = startIndex; i < objectCount; i++)
		{
			stringbuf.append(heap[i]);
			if (i < objectCount - 1)
				stringbuf.append(", ");
		}

		stringbuf.append("]\nor alternatively,\n");

		for (int rowLength = 1, j = 0; j < objectCount; rowLength *= 2) {
			for (int i = 0; i < rowLength && j < objectCount; i++, j++) {
				stringbuf.append(heap[j] + " ");
			}
			stringbuf.append("\n");
			if (j < objectCount)
			{
				for (int i = 0; i < Math.min(objectCount - j, rowLength*2); i++)
				{
					if (i%2 == 0)
						stringbuf.append("/");
					else
						stringbuf.append("\\ ");
				}
				stringbuf.append("\n");
			}
		}

		return stringbuf.toString();
	}
	
	//thing callled by my things to do the ting that need to be done
	private void insureCapacity() {
		if (heap.length <= objectCount) {
			increaseCapacity();
		}
	}

	//makes the dumb internal array bigger so it can fit more of the users dumb inputs in
	private void increaseCapacity() {
		E[] newHeap = (E[])new Comparable[objectCount*2];
		for (int i = startIndex; i < heap.length; i++) {
			newHeap[i] = heap[i];
		}
		heap = newHeap;
	}

	//has to do dumb math so it can inject heroin into the code and return the parent node
	private int parent(int i) {
		return ((i + 1) / 2) - 1;
	}

	//returns the ip adress of the smaller child of an index, -1 if they are homeless
	private int smallerChild (int i) {
		int child1 = ((i + 1) * 2 ) - 1;
		int child2 = child1++;
		if (child1 > objectCount) {
			return -1;
		} else if (child2 > objectCount) {
			return child1;
		} else if (heap[child1].compareTo(heap[child2]) < 0){
			return child1;
		} else {
			return child2;
		}
	}

	//steals a kid from one home and donates them to the other house still has to steal from that house so everything can be fair
	private void swap (int i, int j) {
		E temp = heap[i];
		heap[i] = heap[j];
		heap[j] = temp;
	}

	//i bet this meathod has a really cool sound effect
	private void bubbleUp (int i) {
		///*
		if (i > startIndex && heap[i].compareTo(heap[parent(i)]) < 0) {
			swap(i, parent(i));
			bubbleUp(parent(i));
		}
		//*/

		/*
		int currentIndex = i;
		while (currentIndex > startIndex && heap[currentIndex].compareTo(heap[parent(currentIndex)]) < 0) {
			swap(currentIndex, parent(currentIndex));
			currentIndex = parent(currentIndex);
		}
		*/
	}
	
	//i like this one
	private void bubbleDown (int i) {
		
		///*
		if (smallerChild(i) > -1 && heap[i].compareTo(heap[smallerChild(i)]) > 0) {
			int indexSchild = smallerChild(i); //there has to be a way to get rid of this cringe thing
			swap(i, indexSchild);
			bubbleDown(indexSchild);
		}
		//*/

		/*
		int currentIndex = i;
		while (smallerChild(currentIndex) > -1 && heap[currentIndex].compareTo(heap[smallerChild(currentIndex)]) > 0 ) { 
			int indexSchild = smallerChild(currentIndex);
			swap(currentIndex, indexSchild);
			currentIndex = indexSchild;
		}
		*/
	}
}
