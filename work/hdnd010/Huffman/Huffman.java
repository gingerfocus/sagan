import java.util.HashMap;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.PriorityQueue;
import java.io.File;
import java.io.PrintWriter;

import java.io.File;
import java.util.Scanner;
import java.util.HashMap;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.Character;

import java.io.File;
import java.util.Scanner;
import java.util.HashMap;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

public class HuffmanNode implements Comparable {
	public HuffmanNode leftNode;
	public HuffmanNode rightNode;
	public int value;
	public char character;

	public HuffmanNode (HuffmanNode leftNode, HuffmanNode rightNode, int value, char character) {
		this.leftNode = leftNode;
		this.rightNode = rightNode;
		this.value = value;
		this.character = character;
	}

	public void setLeft (HuffmanNode node) { leftNode = node; }
	public void setRight (HuffmanNode node) { rightNode = node; }

	public int compareTo (Object other) {
		HuffmanNode nodeTest = (HuffmanNode)other;
		int otherValue = nodeTest.value;
		if (otherValue < value) {
			return 1;
		} else if (otherValue > value) {
			return -1;
		} else {
			return 0;
		}
	}

	public int getValue () {
		return value;
	}

	public boolean isLeaf () {
		return character != (char)-1 ;
	}
}

public class HuffmanDecoder {
	public String curBinary;
	public int zerosAtEnd;
	public HashMap binaryMap;

	public HuffmanDecoder (String codeFile) {
		zerosAtEnd = 0;
		curBinary = "";

		binaryMap = new HashMap();

		File file = null;
		try { file = new File(codeFile); }
		catch (Exception e1) { System.exit(1); }

		Scanner input = null;
		try { input = new Scanner(file); }
		catch (Exception e2) { System.exit(1); }


		for (int i = 0; i < 128; i++) {
			String cur = input.nextLine();
			if (!cur.equals("")) {
				binaryMap.put(cur, (Character)(char)i);
			}
		}
	}

	public void decodeLong(String encodedFile, String decodedFile) throws IOException {
		
		BufferedReader input = null;
		try { input = new BufferedReader(new FileReader(encodedFile)); }
		catch (Exception e1) { System.exit(1); } 
		
		PrintWriter author = null; 
		try { author = new PrintWriter(decodedFile);}
		catch (Exception e2) { System.exit(1); }
		
		int letterValue;
		int currentDepth = 0;

		while (input.ready()) {
			letterValue = input.read();

			if (input.ready()) {
				curBinary += convertToBinary(letterValue);
				
				//System.out.println(" +" +  convertToBinary(letterValue) + " ~ (" + letterValue + ")");

				while (curBinary.length() > currentDepth) {
					currentDepth++;				

					//System.out.println(curBinary);

					if (isCode(curBinary.substring(0, currentDepth))) {
						String tempBinary = curBinary.substring(0, currentDepth);
						curBinary = curBinary.substring(currentDepth, curBinary.length());
						char tempChar = decodeChar(tempBinary);
						//System.out.println(tempChar + " <= " + tempBinary);
						author.print(tempChar);
						currentDepth = 0;
					} 
				}

			} else {
				zerosAtEnd = letterValue;
				curBinary = curBinary.substring(0, curBinary.length()-zerosAtEnd);
			}
		}

		input.close();

		while (curBinary.length() > 0) {
			currentDepth++;
			if (isCode(curBinary.substring(0, currentDepth))) {
				String tempBinary = curBinary.substring(0, currentDepth);
				curBinary = curBinary.substring(currentDepth, curBinary.length());
				char tempChar = decodeChar(tempBinary);
				//System.out.println(tempChar + " <= " + tempBinary + " END");
				author.print(tempChar);
				currentDepth = 0;
			} 
		}
		
		//System.out.println(curBinary.substring(curBinary.length()-zerosAtEnd, curBinary.length()));

		author.close();
	}

	public void decodeFile(String inputFile) throws IOException {
		decodeLong(inputFile, "output.txt");
	}


	public boolean isCode (String binary) { return binaryMap.containsKey(binary); }
	public char decodeChar (String binary) { 
		Character letter = (Character)binaryMap.get(binary);
		return letter.charValue();
	}


	private String convertToBinary (int num) {
		String binary = "";
		for (int i = 7; i >= 0; i--) {
			if (num % 2 == 0) {
				binary = "0" + binary;
			} else {
				binary = "1" + binary;
			}
			num /= 2;
		}
		return binary;
	}
	private int dosExp (int power) {
		if (power == 0) {
			return 1;
		} else {
			return 2 * dosExp(power-1);
		}
	}
}


public class HuffmanEncoder {
	HashMap<Character, String> codeMap;


	public HuffmanEncoder (String codeFile) {
		codeMap = new HashMap();

		File file = null;
		try { file = new File(codeFile); }
		catch (Exception e1) { System.exit(1); }

		Scanner input = null;
		try { input = new Scanner(file); }
		catch (Exception e1) { System.exit(1); }

		for (int i = 0; i < 128; i++) {
			String cur = input.nextLine();
			if (!cur.equals("")) {
				codeMap.put((Character)(char)i, cur);
			}
		}
	}

	public String encodeChar(char input) {
		return (String)codeMap.get((Character)input);
	} 

	public void encodeLong (String inputFile, String outputFile) throws IOException {
		String binary = "";

		BufferedReader input = null;
		
		try { input = new BufferedReader(new FileReader(inputFile)); }
		catch (Exception e1) { System.exit(1); } 

		
		PrintWriter author = null; 
		try { author = new PrintWriter(outputFile); }
		catch (Exception e2) { System.exit(1); }

		char letter;
		while (input.ready()) {
			letter = (char)input.read();
			binary += encodeChar(letter);
			
			//System.out.println(" +" + encodeChar(letter) + " ~ (" + letter + ")");
			//System.out.print(letter);

			while (binary.length() > 8) {
				if (binary.length() > 8) {
					String cur = binary.substring(0, 8);
					binary = binary.substring(8, binary.length());

					int intValue = binaryToInt(cur);

					//System.out.println(cur + " => " + (char)intValue);
					author.print((char)intValue);
				}
			}
		}

		int addedZeros = 0;
		while (binary.length() < 8) {
			binary += "0";
			addedZeros++;
		}

		int temp = binaryToInt(binary);
		
		//System.out.println(binary + " => " + temp);
		author.print((char)temp);
	
		//System.out.println("End String" + " => " + addedZeros);
		author.print((char)addedZeros);
		

		author.close();
		input.close();

	}

	public void encodeFile(String inputFile) throws IOException {
		encodeLong(inputFile, inputFile + ".huf");
	}

	public int binaryToInt(String binary) {
		int baseTwoValue = 0;
		for (int i = 0; i < 8; i++) {
			baseTwoValue += Integer.parseInt(binary.substring(7-i, 8-i)) * dosExp(i);
		}
		return baseTwoValue;
	}

	public int dosExp (int power) {
		if (power == 0) {
			return 1;
		} else {
			return 2 * dosExp(power-1);
		}
	}

}


public class HuffmanCodeGenerator {
	
	public HashMap letterFrequencies;
	public HuffmanNode head;
	public HashMap codes;

	public HuffmanCodeGenerator (String inputFile) throws IOException {
		

		this.letterFrequencies = new HashMap<Character, Integer>();
		BufferedReader input = null;
		
		try { input = new BufferedReader(new FileReader(inputFile)); }
		catch (Exception e) { System.exit(1); } 


		Character letter;
		while (input.ready()) {
			letter = (Character)(char)input.read();
			Integer value = (Integer)letterFrequencies.putIfAbsent(letter, (Integer)1);

			//System.out.print(letter);

			if (value != null) { letterFrequencies.replace(letter, (Integer)(value.intValue() + 1)); }
		}
		input.close();

		head = makeHuffmanTree();
		codes = new HashMap<Character, String>();
		computeCodes(head, "");
		

		//Integer.byteValue();
	}

	public void computeCodes(HuffmanNode node, String code) {
		if (node.isLeaf()) {
			codes.putIfAbsent((Character)node.character, code);
		} else {
			computeCodes(node.leftNode, code + "0");
			computeCodes(node.rightNode, code + "1");

		}
	}

	public int getFrequency (char c) {
		Integer thing = (Integer)letterFrequencies.get((Character)c);
		if (thing == null) { return 0; }
		else { return thing.intValue(); }
	}

	private HuffmanNode makeHuffmanTree () {
		PriorityQueue<HuffmanNode> treeQueue = new PriorityQueue<HuffmanNode>();

		for (int i = 0; i < 128; i++) {
			Integer num = (Integer)letterFrequencies.get((Character)(char)i);
			if (num != null) {
				HuffmanNode node = new HuffmanNode(null, null, num.intValue(), (char)i);
				treeQueue.add(node);

			}
		}

		while (treeQueue.size() > 1) {
			HuffmanNode nodeSmaller = treeQueue.poll();
			HuffmanNode nodeLarger = treeQueue.poll();

			treeQueue.add(new HuffmanNode(nodeSmaller, nodeLarger, nodeSmaller.getValue() + nodeLarger.getValue(), (char)-1));
		}

		return treeQueue.poll();
	}
	public String getCode(char c) { return (String)codes.get((Character)c); }
	public void makeCodeFile(String codeFile) {
		File file = null;
		try { file = new File(codeFile); }
		catch (Exception e1) { System.exit(1); }
		
		PrintWriter author = null; 

		try { author = new PrintWriter(file); }
		catch (Exception e2) { System.exit(1); }

		for (int i = 0; i < 128; i++) {
			char letter = (char)i;
			if (this.getCode(letter) == null) {
				author.println();
			} else {
				author.println(this.getCode(letter));
			}
		}

		author.close();
	}

//-----------------------------------------------------------------------------------------------------------------

/*
	public static void main (String [] args) {
		String inputFile = "input.txt";

		HuffmanCodeGenerator a = null;
		try { a = new HuffmanCodeGenerator(inputFile); }
		catch (Exception e1) { System.exit(1); }

		a.makeCodeFile("code.txt");

		System.out.println("CODE MADE");

		HuffmanEncoder encoder = new HuffmanEncoder("code.txt"); 

		try {encoder.encodeFile(inputFile);}
		catch (Exception e2) { System.exit(1); }

		System.out.println("ENCODED");

		HuffmanDecoder decoder = new HuffmanDecoder("code.txt");
		try { decoder.decodeFile(inputFile + ".huf"); }
		catch (Exception e3) { System.exit(1); }

		System.out.println("DECODED");
	}
*/

}
