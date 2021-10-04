import java.util.Scanner;

class Soma {

   public static void main( String[] args ) {
      int x, y;
      Scanner s = new Scanner( System.in );
      System.out.println( "Digite um numero: ");
      x = s.nextInt();
      System.out.println( "Digite um numero: ");
      y = s.nextInt();
      System.out.println( "Resultado: " + (x + y) );
   }

}