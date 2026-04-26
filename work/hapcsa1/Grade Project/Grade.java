public class Grade {    
    private double grade;    
    public Grade(double grade) {
        this.grade=grade;   
    }   
    public char getLetter() {
        if(grade>=90)  {return 'A';} 
        else if (grade>=80) {return 'B';} 
        else if (grade>=70) {return 'C';}  
        else if (grade>=60) {return 'D';}       
        else {return 'F';}
    }
    
    public void setGrade(double g) {
        grade = g;    
    }
    
    public String toString() {
        return "" + grade;
    }
} 