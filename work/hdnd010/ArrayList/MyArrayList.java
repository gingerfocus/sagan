public class MyArrayList<E> {
    protected int objectCount;
    protected E [] internalArray;
    protected int internalArrLength;
    
    //makes the MyArraylist object which should be killed with fire
	@SuppressWarnings("unchecked")
    public MyArrayList() {
        this.internalArray = (E[]) new Object[100];
        this.internalArrLength = 100;
    }
    
    //a different dumb way to make the myArrayList class that needs and initialCapacity and should also be killed with
	@SuppressWarnings("unchecked")
    public MyArrayList(int initialCapacity){
        this.internalArray = (E[]) new Object[initialCapacity];
        this.internalArrLength = initialCapacity;
    }

    //returns the object count or the number of active slots in the array
    //O(1)
    public int size() {return objectCount;}
    
    //returns bool based on wather object count == 0
    //O(1)
    public boolean isEmpty() {
        if (objectCount <= 0) {return true;}
        else {return false;}
    }
    
    //gets the object at the index choosen
    //O(1)
    public E get(int index) {
        if (index < 0 || index > objectCount) {throw new IndexOutOfBoundsException("Oopsy woopsy, index " + index + " is out of bounds for length " + objectCount + ". Try not to be so dumb in the future!");}
        else {return internalArray[index];}
    }
    
    //replaces the object at index with obj and returns object that was replaced
    //O(1)
    public E set(int index, E obj) {
        if (index < 0 || index > objectCount) {throw new IndexOutOfBoundsException("Oopsy woopsy, index " + index + " is out of bounds for length " + objectCount + ". Try not to be so dumb in the future!");}
        else {
            E retObj = internalArray[index];
            internalArray[index] = obj;
            return retObj;
        }
    }

	//Returns true if this list contains an element equal to obj, otherwise returns false.
    //O(n)
    public boolean contains(E obj) {
        for (int i = 0; i < objectCount; i++) {
            if (internalArray[i] == null) {
                if (internalArray[i] == obj) {return true;}
            }
            else if (internalArray[i].equals(obj)) {
                return true;
            }
        }
        return false;
    }
    
    //Insert an object at index
    //O(n)
	@SuppressWarnings("unchecked")
    public void add(int index, E obj) {
        checkAndExtendArray();
        if (index < 0 || index > objectCount) {
            throw new IndexOutOfBoundsException("Oopsy woopsy, index " + index + " is out of bounds for length " + objectCount + ". Try not to be so dumb in the future!");
        } else {
            objectCount++;
            for (int i = objectCount; i > index; i--) {
                internalArray[i] = internalArray[i-1];
            }
            internalArray[index] = obj; 
        }
    }

    //you add the stupid object to the stupid class
    //O(1)
    @SuppressWarnings("unchecked")
    public boolean add(E obj) {
        checkAndExtendArray();
        internalArray[objectCount] = obj;
        objectCount++;
        return true;
    }

    //remove the object and return the removed thing, also moves thing over so the class still works
    //O(n)
    public E remove(int index) {
        if (index < 0 || index > objectCount) {
            throw new IndexOutOfBoundsException("Oopsy woopsy, index " + index + " is out of bounds for length " + objectCount + ". Try not to be so dumb in the future!");
        } else {
            E retObj = internalArray[index];
            for (int i = index; i <= objectCount; i++) {
                internalArray[i] = internalArray[i+1];
            }
            objectCount--;
            return retObj;
        }
    }
    
    //removes the first occurance of obj then returns true if the array change as a result of method
    //O(n)
    public boolean remove(E obj) {
        for (int i = 0; i < objectCount; i++) {
            if (internalArray[i] != null && internalArray[i].equals(obj) ) {
                remove(i);
                return true;
            }
            else if (internalArray[i] == obj) {
                remove(i);
                return true;
            }
        }
        return false;
    }
    
    //the toString, does the meathod things
    //O(n)
    public String toString() {
        String returnWord = "[";
        if (objectCount <= 0) {
            returnWord += "]";
            return returnWord;
        } else {
            returnWord += internalArray[0];
            for (int i = 1; i < objectCount; i++) {
                returnWord += ", ";
                returnWord += internalArray[i];
            }
            returnWord += "]";
            return returnWord;
        }
    }

    //move all instances of an object, keeping all objects in the same relative order
    //dont have to check for nulls in ONLY THIS MEATHOD
    public void moveToBack(E obj) {
        E[] tempArr = (E[]) new Object[objectCount];
        int moveVal = 0;
        for(int i = 0; i < objectCount; i++) {
            if (internalArray[i].equals(obj)) {
                tempArr[moveVal] = internalArray[i];
                moveVal++;
            }
            if (i + moveVal < objectCount) {
                internalArray[i] = internalArray[i + moveVal];
            }
        }
        
        int count = 0;
        for (E objecto : tempArr) {
            if (objecto == null) {
                return;
            } else {
                internalArray[objectCount - moveVal + count] = objecto;
                count++;
            }
        }

        //this is the worst code I have ever written but it has a O(n) so i must now sleep
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------------

    @SuppressWarnings("unchecked")
    public E[] extendArray () {
        E[] newArray = (E[]) new Object[objectCount * 2]; 
        for (int i = 0; i < internalArrLength; i++) {
            newArray[i] = internalArray[i];
        }
        internalArrLength = objectCount * 2;
        return newArray;
    }

    //checks if the array needs extention then if it does in increases it
    public void checkAndExtendArray () {if (objectCount == internalArrLength) {internalArray = extendArray();}}

    //----------------------------------------------------------------------------------------------------------------------------------------------------------------------

    @SuppressWarnings("unchecked")
    public static void main (String [] args) {
        MyArrayList l = new MyArrayList();
        
        System.out.println("Checking basic errors: ------------------------");
        System.out.println(l.toString());

        //checks add
        l.add(4);
        System.out.print(l.toString() + " | ");
        System.out.println(l.get(0) + " - 4");

        //checks add agian and index out of bounds
        l.add(7);
        System.out.print(l.toString() + " | ");
        System.out.print(l.get(1) + " - 7 | ");
        try {
            l.get(5);
            System.out.println(l.get(5) + " - error");
        }
        catch (Exception e) {
            System.out.println("error - error");
        }

        //checks adding at index
        l.add(1, 5);
        System.out.print(l.toString() + " | ");
        System.out.print(l.get(1) + " - 5 | ");
        System.out.println(l.get(2) + " - 7");

        //checks size meathod
        System.out.print(l.toString() + " | ");
        System.out.println(l.size() + " - 3");

        //checks isEmpty
        System.out.print(l.toString() + " | ");
        System.out.println(l.isEmpty() + " - false");

        //checks set meathod
        l.set(1, 0);
        System.out.print(l.toString() + " | ");
        System.out.println(l.get(1) + " - 0");

        //cheks contains meathod
        System.out.print(l.toString() + " | ");
        System.out.print(l.contains(9) + " - false | ");
        System.out.println(l.contains(0) + " - true");

        //checks remove
        Object var = l.remove(1);
        System.out.print(l.toString() + " | ");
        System.out.println(var + " - 0");

        System.out.println("Checking stupid errors: ------------------------");
        
        MyArrayList m = new MyArrayList();
        System.out.println(m.toString());
        
        //filling list
        m.add("bruh");
        m.add("bruh2");
        m.add("bruh3");
        System.out.println(m.toString());

        //checking set for null input
        m.set(1, null);
        System.out.print(m.toString() + " | ");

        //checking null for contains
        System.out.println(m.contains(null) + " - true");
        
        //checking adding nulls
        m.add(null);
        System.out.println(m.toString());
        
        m.add(1, null);
        System.out.println(m.toString());

        //checking remove nulls
        m.remove(null);


        System.out.println("==========================================================================");


        System.out.print(m.toString() + " | ");
        System.out.println(m.contains("bruh3") + " - true");
        
        m.remove(2);
        System.out.print(m.toString() + " | ");
        System.out.println(m.contains("bruh3") + " - false");
    }
}