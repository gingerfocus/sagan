public class StringMethods
{
    public static void main (String [] args) {
        String name = "Evan Stokdyk";
        String other = "okdy";
        int offset = 3;
        int indexEnd = 7;
        
        char firstLetter = name.charAt(0);
        System.out.println(firstLetter);
        
        int lettersWrong = name.compareTo("Evan"); //differencce of first letter that doesnt match
        System.out.println(lettersWrong);
        
        boolean isOther = name.equals(other); //exacly equal
        System.out.println(isOther);
        
        int indexOf = name.indexOf("k"); //finds first instance, returns -1 if not found, case matters
        System.out.println(indexOf);
        
        int nameLenght = name.length(); //length countin form 0
        System.out.println(nameLenght);
        
        String subString1 = name.substring(offset, indexEnd); //returns imbeded word
        System.out.println(subString1);
        
        String subString2 = name.substring(offset); //same as subtring but goes from offset to end
        System.out.println(subString2);
    }
}
