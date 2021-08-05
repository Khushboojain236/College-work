import static org.junit.Assert.assertEquals;

import org.hamcrest.core.IsEqual;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;





//-------------------------------------------------------------------------
/**
 *  Test class for SortComparison.java
 *
 *  @author Khushboo Jain
 *  @version HT 2020
 */
@RunWith(JUnit4.class)
public class SortComparisonTest
{
    //~ Constructor ........................................................
    @Test
    public void testConstructor()
    {
        new SortComparison();
    }

    //~ Public Methods ........................................................

    // ----------------------------------------------------------
    /**
     * Check that the methods work for empty arrays
     */
    @Test
    public void testEmpty()
    {
    	double[] emptyArray=null;
    	SortComparison.insertionSort(emptyArray);
    	assertEquals("Testing insertion on empty", null, SortComparison.insertionSort(emptyArray));
    	SortComparison.selectionSort(emptyArray);
    	assertEquals("Testing selection on empty", null, SortComparison.selectionSort(emptyArray));
    	SortComparison.quickSort(emptyArray);
    	assertEquals("Testing quicksort on empty", null, SortComparison.quickSort(emptyArray));
    	SortComparison.mergeSort(emptyArray);
    	assertEquals("Testing mergesort on empty", null, SortComparison.mergeSort(emptyArray));
    }
    


    // TODO: add more tests here. Each line of code and each decision in Collinear.java should
    // be executed at least once from at least one test.

    @Test
    public void testInsertionSort()
    {
    	//one element array 
    	double a[]= {2};
    	double r[]= {2};
    	Assert.assertThat("testing insertion on a single element array ",SortComparison.insertionSort(a), IsEqual.equalTo(r));
    	//two element array
    	double a1[]= {4,3};
    	double r1[]= {3,4};
    	Assert.assertThat("testing insertion on two elements array ",SortComparison.insertionSort(a1), IsEqual.equalTo(r1));
    	//more than 2 elements even number of elements array 
    	double a2[]= {4,3,5,1};
    	double r2[]= {1,3,4,5};
    	Assert.assertThat("testing insertion on an even more than 2 elements array ",SortComparison.insertionSort(a2), IsEqual.equalTo(r2));
    	//more than 2 elements odd number of elements array
    	double a3[]= {4,3,9,8,5};
    	double r3[]= {3,4,5,8,9};
    	Assert.assertThat("testing insertion on an odd more than 2 elements array ",SortComparison.insertionSort(a3), IsEqual.equalTo(r3));
    	//pre-sorted array 
    	double a4[]= {1,2,3,4,5,6,7};
    	double r4[]= {1,2,3,4,5,6,7};
    	Assert.assertThat("testing insertion on a presorted array ",SortComparison.insertionSort(a4), IsEqual.equalTo(r4));
    	//reverse order array 
    	double a5[]= {8,7,6,5,4,3,2,1,0};
    	double r5[]= {0,1,2,3,4,5,6,7,8};
    	Assert.assertThat("testing insertion on a reversed array ",SortComparison.insertionSort(a5), IsEqual.equalTo(r5));
       //all duplicate array 
    	double a6[]= {2,2,2,2,2};
    	double r6[]= {2,2,2,2,2};
    	Assert.assertThat("testing insertion on a duplicate array ",SortComparison.insertionSort(a6), IsEqual.equalTo(r6));
    			
    }
    @Test
    public void testSelectionSort()
    {
    	//one element array 
    	double a[]= {2};
    	double r[]= {2};
    	Assert.assertThat("testing selection on a single element array ",SortComparison.selectionSort(a), IsEqual.equalTo(r));
    	//two element array
    	double a1[]= {4,3,2};
    	double r1[]= {2,3,4};
    	Assert.assertThat("testing selection on two elements array ",SortComparison.selectionSort(a1), IsEqual.equalTo(r1));
    	//more than 2 elements even number of elements array 
    	double a2[]= {4,3,5,1};
    	double r2[]= {1,3,4,5};
    	Assert.assertThat("testing selection on an even more than 2 elements array ",SortComparison.selectionSort(a2), IsEqual.equalTo(r2));
    	//more than 2 elements odd number of elements array
    	double a3[]= {10,3,9,8,5};
    	double r3[]= {3,5,8,9,10};
    	Assert.assertThat("testing selection on an odd more than 2 elements array ",SortComparison.selectionSort(a3), IsEqual.equalTo(r3));
    	//pre-sorted array 
    	double a4[]= {1,2,3,4,5,6,7};
    	double r4[]= {1,2,3,4,5,6,7};
    	Assert.assertThat("testing selection on a presorted array ",SortComparison.selectionSort(a4), IsEqual.equalTo(r4));
    	//reverse order array 
    	double a5[]= {8,7,6,5,4,3,2,1,0};
    	double r5[]= {0,1,2,3,4,5,6,7,8};
    	Assert.assertThat("testing selection on a reversed array ",SortComparison.selectionSort(a5), IsEqual.equalTo(r5));
       //all duplicate array 
    	double a6[]= {2,2,2,2,2};
    	double r6[]= {2,2,2,2,2};
    	Assert.assertThat("testing selection on a duplicate array ",SortComparison.selectionSort(a6), IsEqual.equalTo(r6));
    			
    }
    @Test
    public void testQuickSort()
    {
    	//one element array 
    	double a[]= {2};
    	double r[]= {2};
    	Assert.assertThat("testing quicksort on a single element array ",SortComparison.quickSort(a), IsEqual.equalTo(r));
    	//two element array
    	double a1[]= {4,3,2};
    	double r1[]= {2,3,4};
    	Assert.assertThat("testing quicksort on two elements array ",SortComparison.quickSort(a1), IsEqual.equalTo(r1));
    	//more than 2 elements even number of elements array 
    	double a2[]= {4,3,5,1};
    	double r2[]= {1,3,4,5};
    	Assert.assertThat("testing quicksort on an even more than 2 elements array ",SortComparison.quickSort(a2), IsEqual.equalTo(r2));
    	//more than 2 elements odd number of elements array
    	double a3[]= {10,3,9,8,5};
    	double r3[]= {3,5,8,9,10};
    	Assert.assertThat("testing quicksort on an odd more than 2 elements array ",SortComparison.quickSort(a3), IsEqual.equalTo(r3));
    	//pre-sorted array 
    	double a4[]= {1,2,3,4,5,6,7};
    	double r4[]= {1,2,3,4,5,6,7};
    	Assert.assertThat("testing quicksort on a presorted array ",SortComparison.quickSort(a4), IsEqual.equalTo(r4));
    	//reverse order array 
    	double a5[]= {8,7,6,5,4,3,2,1,0};
    	double r5[]= {0,1,2,3,4,5,6,7,8};
    	Assert.assertThat("testing quicksort on a reversed array ",SortComparison.quickSort(a5), IsEqual.equalTo(r5));
       //all duplicate array 
    	double a6[]= {2,2,2,2,2};
    	double r6[]= {2,2,2,2,2};
    	Assert.assertThat("testing quicksort on a duplicate array ",SortComparison.quickSort(a6), IsEqual.equalTo(r6));
    }
    
    @Test
    public void testMergeSort()
    {
    	//one element array 
    	double a[]= {2};
    	double r[]= {2};
    	Assert.assertThat("testing mergesort on a single element array ",SortComparison.mergeSort(a), IsEqual.equalTo(r));
    	//two element array
    	double a1[]= {4,3,2};
    	double r1[]= {2,3,4};
    	Assert.assertThat("testing mergesort on two elements array ",SortComparison.mergeSort(a1), IsEqual.equalTo(r1));
    	//more than 2 elements even number of elements array 
    	double a2[]= {4,3,5,1};
    	double r2[]= {1,3,4,5};
    	Assert.assertThat("testing mergesort on an even more than 2 elements array ",SortComparison.mergeSort(a2), IsEqual.equalTo(r2));
    	//more than 2 elements odd number of elements array
    	double a3[]= {10,3,9,8,5};
    	double r3[]= {3,5,8,9,10};
    	Assert.assertThat("testing mergesort on an odd more than 2 elements array ",SortComparison.mergeSort(a3), IsEqual.equalTo(r3));
    	//pre-sorted array 
    	double a4[]= {1,2,3,4,5,6,7};
    	double r4[]= {1,2,3,4,5,6,7};
    	Assert.assertThat("testing mergesort on a presorted array ",SortComparison.mergeSort(a4), IsEqual.equalTo(r4));
    	//reverse order array 
    	double a5[]= {8,7,6,5,4,3,2,1,0};
    	double r5[]= {0,1,2,3,4,5,6,7,8};
    	Assert.assertThat("testing mergesort on a reversed array ",SortComparison.mergeSort(a5), IsEqual.equalTo(r5));
       //all duplicate array 
    	double a6[]= {2,2,2,2,2};
    	double r6[]= {2,2,2,2,2};
    	Assert.assertThat("testing mergesort on a duplicate array ",SortComparison.mergeSort(a6), IsEqual.equalTo(r6));
    			
    }
    
   
    // ----------------------------------------------------------
    /**
     *  Main Method.
     *  Use this main method to create the experiments needed to answer the experimental performance questions of this assignment.
     *
     */
    public static void main(String[] args)
    {
        //TODO: implement this method
    }

}


