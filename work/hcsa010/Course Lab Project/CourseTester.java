public class CourseTester
{
    public static void main(String[] args)
    {
        int[] scores1 = {50, 50, 20, 80, 53};
        int[] scores2 = {20, 50, 50, 53, 80};
        int[] scores3 = {20, 50, 50, 80, 70};
        

        
        StudentRecord student1 = new StudentRecord("Jack", scores1);
        StudentRecord student2 = new StudentRecord("Steve", scores2);
        StudentRecord student3 = new StudentRecord("Kevin", scores3);
        
        System.out.println(student1);
        System.out.println("Final Average for Jack : " + student1.finalAverage());
        System.out.println(student2);
        System.out.println("Final Average for Steve : " + student2.finalAverage());
        System.out.println(student3);
        System.out.println("Final Average for Kevin : " + student3.finalAverage());     
         
        StudentRecord[] students = {student1, student2, student3};
        
        Course course1 = new Course("AP Comp Sci", students);
        System.out.println("\nThe student with the best average: " + course1.computeBestStudent() + "\n");
          
        System.out.println("The average of test 0: " + course1.testAverage(0));
        System.out.println("The average of test 1: " + course1.testAverage(1));
        System.out.println("The average of test 2: " + course1.testAverage(2));
        System.out.println("The average of test 3: " + course1.testAverage(3));
    }
}