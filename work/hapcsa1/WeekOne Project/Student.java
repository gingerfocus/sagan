public class Student
{
    public Student (double grade, int numberOfClasses, int yearsOld, String nameOfSchool)
    {
        classGrade = grade;
        classesIn = numberOfClasses;
        age = yearsOld;
        school = nameOfSchool;
    }
    
    private double classGrade;
    private int classesIn;
    private int age;
    private String school;
    
    public int getNumberOfClass () {
        return classesIn;
    }
    
    public boolean isPassingClass () {
        if (classGrade >= 60)
            return true;
        else
            return false;
    }
    
    public String getGradeLevel () {
        if (age == 9)
            return "Freashman";
        else if (age == 10)
            return "Sophmore";
        else if (age == 11)
            return "Junior";
        else if (age == 12)
            return "Senor";
        else 
            return "Not in High School";
    }
    
    public void hasBirthday () {
        age++;
    }
    
    public void changeSchool (String newSchool) {
        school = newSchool;
    }
}