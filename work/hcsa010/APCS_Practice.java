public class codeWordChecker implements StringChecker {
	private final int begin;
	private final int end;
	private final String code;

	public codeWordChecker (int begin, int end, String code) {
		this.begin = begin;
		this.end = end;
		this.code = code;
	}

	public codeWordChecker (String code) {
		this.begin = 6;
		this.end = 20;
		this.code = code;
	}

	public boolean isValid(String check) {
		if (check.length() > end || check.length() < begin || check.contains(code))
			return false;
		return true;
	}
}

public class ArrayTester {
	public static boolean hasAllValues (int[] arr1, int[] arr2) {
		//epic code not pictured
	}

	public static boolean containsDuplicates (int[] arr1) {
		//epic code not pictured
	}

	public static int[] getColumn (int[][] arr2D, int c) {
		int[] temp = new int[arr2D.length]; 
		for (int r = 0; r <= temp.length; r++) {
			temp[r] = arr2D[r][c];
		}
		return temp;
	}

	public static boolean isLatin (int[][] square) {
		if (containsDuplicates(square[0]))
			return false;
		for (int r = 1; r < square.length; r++) {
			if (!hasAllValues(square[0], square[r]))
				return false;
		}
		for (int c = 0; c < square[0].length; c++) {
			if (!hasAllValues(square[0], getColumn(square, c)))
				return false;
		}		
		return true;
	}
}