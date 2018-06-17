// https://projecteuler.net/problem=100
// A Java rewrite of 100.1.rb, I can't actaully tell if it's faster...
// though it's definitely a lot less clear. It took ~2 hours to run.
// Final result: b: 756872327473, r: 313506783024, a: 1070379110497, s: 886731088897
// Solution:     756872327473

import static java.lang.Math.sqrt;
import java.math.BigInteger;

public class PE100 {
  static BigInteger zero    = new BigInteger("0");
  static BigInteger one     = new BigInteger("1");
  static BigInteger two     = new BigInteger("2");
  static BigInteger three   = new BigInteger("3");
  static BigInteger four    = new BigInteger("4");
  static BigInteger eight   = new BigInteger("8");
  static BigInteger sixteen = new BigInteger("16");

  public static void main(String[] args) {
    BigInteger rRoot   = new BigInteger("292893218813");
    // BigInteger rRoot   = new BigInteger("7");
    // BigInteger rRoot   = new BigInteger("37");
    BigInteger s       = rRoot.multiply(rRoot).multiply(eight).add(one);
    BigInteger sRoot   = new BigInteger("828427124743"); // there/s not a square root function for this type, so hard-code it for this value, even though that means we may have to come change it
    BigInteger sSquare = sRoot.multiply(sRoot);

    while(true) {
      show(rRoot, sRoot);
      for(int i=0; i < 10000000; ++i) {
        int cmp = sSquare.compareTo(s);
        if(cmp<0) {
          sRoot   = sRoot.add(two);
          sSquare = sRoot.multiply(four).subtract(four).add(sSquare); // sSquare += 4*sRoot-4
        } else {
          if(cmp == 0) {
            System.out.println("WINNING!");
            show(rRoot, sRoot);
            return;
          }
          rRoot = rRoot.add(one);
          s = rRoot.multiply(sixteen).subtract(eight).add(s); // s += 16*rRoot-8
        }
      }
    }
  }

  public static void show(BigInteger r, BigInteger sRoot) {
    // b = (2*r + 1 + sRoot)/2;
    BigInteger b = r.multiply(two).add(one).add(sRoot).divide(two);
    System.out.printf(
      "b: %s, r: %s, a: %s, s: %s\n",
      b.toString(), r.toString(), b.add(r).toString(), sRoot.toString()
    );
  }
}
