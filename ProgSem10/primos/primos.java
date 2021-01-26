import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Scanner;

class SieveOfEratosthenes {
  void sieveOfEratosthenes(int n) {
    boolean prime[] = new boolean[n + 1];
    for (int i = 0; i < n; i++)
      prime[i] = true;

    for (int p = 2; p * p <= n; p++) {
      if (prime[p] == true) {
        for (int i = p * p; i <= n; i += p)
          prime[i] = false;
      }
    }

    for (int i = 2; i <= n; i++) {
      if (prime[i] == true)
        System.out.print(i + " ");
    }
  }

  public static void main(String args[]) {
    BufferedReader reader =
        new BufferedReader(new InputStreamReader(System.in));
    System.out.println(
        "Ingrese el numero hasta el cual se desean saber los primos: ");
    Scanner in = new Scanner(System.in);
    String n = in.nextLine();
    SieveOfEratosthenes g = new SieveOfEratosthenes();
    g.sieveOfEratosthenes(Integer.valueOf(n));
  }
}
