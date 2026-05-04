public class StringOpsTester 
{
    public static void main(String [] args) 
    {
        String fullName = "Dude Man Child";
        
        System.out.println(StringOps.awesomeness(fullName));
        System.out.println("Index of 1st Space: " + StringOps.indexFirstSpace(fullName));
        System.out.println("Index of 2nd Space: " + StringOps.indexSecondSpace(fullName));
        System.out.println("The first name is " + StringOps.firstName(fullName));
        System.out.println("The last name is " + StringOps.lastName(fullName));
        System.out.println("The middle name is " + StringOps.middleName(fullName));
        System.out.println("Last Name, First Name, Middle Initial is " + StringOps.lastFirstMidInitial(fullName));

        String first = StringOps.firstName(fullName);
        String last = StringOps.lastName(fullName);

        System.out.println("The result when comparing the first name to the last name using Java’s compareTo() method is " + first.compareTo(last));

    }
}