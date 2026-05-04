public class StringOps
{
    public static String awesomeness(String name){
        return ("I know " + name + "'s name is awesome");
    }
    
    public static int indexFirstSpace(String name){
        return name.indexOf(" ");
    }  

    public static int indexSecondSpace (String name) {
        String afterSpace = name.substring(StringOps.indexFirstSpace(name) + 1);
        String beforeSpace = name.substring(0, StringOps.indexFirstSpace(name));
        return afterSpace.indexOf(" ") + beforeSpace.length() + 1;
    }
    
    public static String firstName(String name) {
        return name.substring(0, StringOps.indexFirstSpace(name));
    }
    
    public static String lastName (String name){
        return name.substring(StringOps.indexSecondSpace(name) + 1);
    }
    
    public static String middleName (String name){
        return name.substring(StringOps.indexFirstSpace(name) + 1, StringOps.indexSecondSpace(name));
    }
    
    public static String lastFirstMidInitial (String name) {
        String middleName = StringOps.middleName(name);
        return (StringOps.lastName(name) + ", "+ StringOps.firstName(name) + ", "+ middleName.charAt(0) + ".");
    }
}