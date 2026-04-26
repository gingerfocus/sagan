public class Monkey  
{
   private int bananaCount;
   private double strength;

   public Monkey( int bananaCount, double strength ) 
   {
      this.bananaCount = bananaCount;
      this.strength = strength;
   }

   public int getBananaCount() 
   {
      return bananaCount;
   }

   public double getStrength() 
   {
      return strength;
   }
   
   public String toString()
   {
       return bananaCount + " " + strength;
   }

   //other methods not shown
}

