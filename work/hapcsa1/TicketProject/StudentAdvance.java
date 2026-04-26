public class StudentAdvance extends Advance
{
    public StudentAdvance () {
        super();
    }
    
    public double getPrice (){
        return super.getPrice()/2;
    }
}
