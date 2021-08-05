import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import java.util.Arrays;

//-------------------------------------------------------------------------
/**
 *  Test class for Collinear.java
 *
 *  @author  
 *  @version 18/09/18 12:21:26
 *  
 *  first set of files
 *  elapsed time 0.45
 *  elapsed time 0.499
 *  
 *  
 *  second set 
 *  elapsed time 3.481
 *  elapsed time 3.691
 *  
 *  third set 
 *  elapsed time 17.073
 *  elapsed time 17.971
 *  
 *  fourth set
 *  elapsed time 33.21
 *  elapsed time 34.639
 */
@RunWith(JUnit4.class)
public class CollinearTest
{

	public static void main(String[] args) {
		 In in = new In("r05000-1.txt");
		 int[] a1 = in.readAllInts();
		 In inp = new In("r05000-2.txt");
		 int[] a2 = inp.readAllInts();
		 In ins = new In("r05000-3.txt");
		 int[] a3=  ins.readAllInts();
		 Stopwatch stopwatch = new Stopwatch();
		 Collinear.countCollinear(a1, a2, a3);
		 double time = stopwatch.elapsedTime();
		 StdOut.println("elapsed time " + time);
		 
		 
		 Stopwatch stopwatchs = new Stopwatch();
		 Collinear.countCollinearFast(a1, a2, a3);
		 double times = stopwatch.elapsedTime();
		 StdOut.println("elapsed time " + times);
		 
	}
    //~ Constructor ........................................................
    @Test
    public void testConstructor()
    {
      new Collinear();
    }

    //~ Public Methods ........................................................

    // ----------------------------------------------------------
    /**
     * Check that the two methods work for empty arrays
     */
    @Test
    public void testEmpty()
    {
        int expectedResult = 0;

        assertEquals("countCollinear failed with 3 empty arrays",       expectedResult, Collinear.countCollinear(new int[0], new int[0], new int[0]));
        assertEquals("countCollinearFast failed with 3 empty arrays", expectedResult, Collinear.countCollinearFast(new int[0], new int[0], new int[0]));
    }

    // ----------------------------------------------------------
    /**
     * Check for no false positives in a single-element array
     */
    @Test
    public void testSingleFalse()
    {
        int[] a3 = { 15 };
        int[] a2 = { 5 };
        int[] a1 = { 10 };

        int expectedResult = 0;

        assertEquals("countCollinear({10}, {5}, {15})",       expectedResult, Collinear.countCollinear(a1, a2, a3) );
        assertEquals("countCollinearFast({10}, {5}, {15})", expectedResult, Collinear.countCollinearFast(a1, a2, a3) );
    }

    // ----------------------------------------------------------
    /**
     * Check for no false positives in a single-element array
     */
    @Test
    public void testSingleTrue()
    {
        int[] a3 = { 15, 5 };       int[] a2 = { 5 };       int[] a1 = { 10, 15, 5 };

        int expectedResult = 1;

        assertEquals("countCollinear(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")",     expectedResult, Collinear.countCollinear(a1, a2, a3));
        assertEquals("countCollinearFast(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")", expectedResult, Collinear.countCollinearFast(a1, a2, a3));
    }


    // TODO: add more tests here. Each line of code and each decision in Collinear.java should
    // be executed at least once from at least one test.
    @Test
    public void testCase()
    {
    	
    	int[] a3 = {23547,-1,-10,30};       int[] a2 = { 56, 69 };       int[] a1 = {-2 };

        int expectedResult = 0;

        assertEquals("countCollinear(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")",     expectedResult, Collinear.countCollinear(a1, a2, a3));
        assertEquals("countCollinearFast(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")", expectedResult, Collinear.countCollinearFast(a1, a2, a3));
    }
  
    @Test
    public void testCase2()
    {
    	
    	int[] a3 = {400,-1,-10};       int[] a2 = { 26, -100 };       int[] a1 = {200};

        int expectedResult = 0;

        assertEquals("countCollinear(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")",     expectedResult, Collinear.countCollinear(a1, a2, a3));
        assertEquals("countCollinearFast(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")", expectedResult, Collinear.countCollinearFast(a1, a2, a3));
    }
  
    
    @Test 
    public void testCase3()
    {
            int[] a3 = { 2};
            int[] a2 = { 3 };
            int[] a1 = { 6,7 };

            int expectedResult = 0;
            assertEquals("countCollinear(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")",     expectedResult, Collinear.countCollinear(a1, a2, a3));
            assertEquals("countCollinearFast(" + Arrays.toString(a1) + "," + Arrays.toString(a2) + "," + Arrays.toString(a3) + ")", expectedResult, Collinear.countCollinearFast(a1, a2, a3));
         
    }
}

