public class Course
{
    String courseName;
    StudentRecord[] myCourse;
    
    public Course(String courseName, StudentRecord[] myCourse)
    {
        this.courseName = courseName;
        this.myCourse = myCourse;
    }
    
    public String computeBestStudent()
    {
        int indexOfBest = -1;
        for (int i = 0; i < myCourse.length; i++) {
            if (myCourse[i].finalAverage() > myCourse[indexOfBest].finalAverage())
                indexOfBest = i;
        }
        return (myCourse[indexOfBest].toString());
    }
    public double testAverage(int testNumber)
    {
        int testTotal = 0;
        for (int i = 0; i < myCourse.length; i++) {
            testTotal += myCourse[i].getScore(testNumber);
        }
        return (testTotal / (myCourse.length));
    }
}