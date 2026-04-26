
public class Test {
	public static void main (String [] args) {
		//String[] ints = new String[]{"a", "b", "l", "f", "r", "c", "t"};
		int[] ints = new int[]{384, 82, 226, 152, 334, 443, 373, 61, 438, 476, 24, 52, 390, 417, 329, 158, 342,
		456, 264, 320, 297, 412, 471, 379, 245, 234, 203, 201, 364, 376, 17, 183, 23, 102, 448, 101, 485, 84,
		401, 181, 161, 155, 59, 321, 204, 182, 228, 48, 198, 106, 391, 414, 213, 488, 341, 12, 356, 51, 238,
		262, 464, 253, 308, 95, 431, 457, 482, 171, 269, 74, 157, 70, 292, 362, 258, 124, 197, 301, 350, 337,
		261, 366, 346, 372, 26, 58, 340, 277, 351, 49, 7, 109, 306, 395, 239, 54, 4, 140, 94, 176, 489};

		HeapPQ a = new HeapPQ();
		for (int thing : ints) {
			a.add(thing);
		}

		System.out.println(a);

		for (int i = 0; i < ints.length; i++) {
			System.out.println(a.removeMin());
		}
		System.out.println(a);
	}







}