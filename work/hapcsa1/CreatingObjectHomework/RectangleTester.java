public class RectangleTester
{
    public static void main(String [] args) {
        Rectangle rectangle1 = new Rectangle(3, 4);
        Rectangle rectangle2 = new Rectangle(6, 6);
        Ball ball1 = new Ball(3, "Golf", false);
        Ball ball2 = new Ball(4, "Soccer", true);
        
        System.out.println(rectangle1);
        System.out.println(rectangle2);
        System.out.println(ball1);
        System.out.println(ball2);
        
        rectangle1.setSide1(6);
        rectangle2.setSide1(10);
        ball1.setSport ("Tennis");
        ball2.setBalls (33);
        
        System.out.println(rectangle1);
        System.out.println(rectangle2);
        System.out.println(ball1);
        System.out.println(ball2);
    }
}
