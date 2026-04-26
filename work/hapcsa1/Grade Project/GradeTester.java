public class GradeTester {
    public static void main (String [] args) {
        Grade[] grades = new Grade [5];
        grades[0] = new Grade(34.0);
        grades[1] = new Grade(76.3);
        grades[2] = new Grade(94.3);
        grades[3] = new Grade(92.1);
        grades[4] = new Grade(83.0);
        
        //prints array 2 different ways
        for (int i = 0; i < grades.length; i++)
            if (grades[i] != null)
                System.out.println(grades[i].getLetter());   
        for (Grade obj : grades)
            if (obj != null)
                System.out.println(obj.getLetter());
        
        //changes array to 85, then prints
        for (Grade obj : grades)
            if (obj != null) {obj.setGrade(85.0);}
        for (Grade obj : grades)
            if (obj != null)
                System.out.println(obj.getLetter());
        
        //sets all objects to null, then prints
        for (Grade obj : grades)
            obj = null;
        for (Grade obj : grades)
            if (obj != null)
                System.out.println(obj.getLetter());
        
        //sets all objects to null, then prints
        for (int i = 0; i < grades.length; i++)
            grades[i] = null;
        for (Grade obj : grades)
            if (obj != null)
                System.out.println(obj.getLetter());
    }
}
