import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

// -------------------------------------------------------------------------

/**
 *  This class contains static methods that implementing sorting of an array of numbers
 *  using different sort algorithms.
 *
 *  @author Khushboo Jain
 *  @version HT 2020
 */

/*
+---------------------+--------+---------+---------+---------+
|time in milliseconds | Insert |Selection| Quick   | Merge   |
+---------------------+--------+---------+---------+---------+
| 1000 Random         |2.077098|4.743199 |3.155800 |1.277331 |
+---------------------+--------+---------+---------+---------+
| 1000 few unique     |5.178481|9.088317 |4.672860 |1.213278 |
+---------------------+--------+---------+---------+---------+
| 1000 nearly ordered |0.617485|12.230541|3.813599 |1.073643 |
+---------------------+--------+---------+---------+---------+
| 1000 reverse order  |4.419725|19.074204|12.094185|1.732433 |
+---------------------+--------+---------+---------+---------+
| 1000 sorted         |0.130438|8.817614 |10.423231|1.064204 |
+---------------------+--------+---------+---------+---------+
| 10000 random       |34.236263|55.920828|46.096761|2.421304 |
+---------------------+--------+---------+---------+---------+

*/

 class SortComparison {

    /**
     * Sorts an array of doubles using InsertionSort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order.
     *
     */
    static double [] insertionSort(double a[]){
        //todo: implement the sort
       if (a!=null) {
    	int i, j;
    	double index ;
    	int size=a.length;
    	for (i=1;i<size;i++) {
    		index=a[i];
    		j=i;
    		while((j>0)&&(a[j-1]>index)) {
    			a[j]=a[j-1];
    			j--;
    		}
    		a[j]=index;
    	}
    	
		return a; 
       }
       else {
    	   return null;
       }
		}//end insertionsort
	
	    /**
     * Sorts an array of doubles using Selection Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order
     *
     */
    static double [] selectionSort(double a[]){
         //todo: implement the sort
    	if(a==null) {
    		return null;
    	}
          else {
			int smallest_index;
			double temp;

			for (int i = 0; i < a.length - 1; i++) {
				// find smallest in unsorted array
				smallest_index = i;
				for (int j = i + 1; j < a.length; j++)
					if (a[j] < a[smallest_index])
						smallest_index = j;

				// Swap
				temp = a[smallest_index];
				a[smallest_index] = a[i];
				a[i] = temp;
			}

			return a;
		}
}//end selectionsort

    /**
     * Sorts an array of doubles using Quick Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order
     *
     */
    static double [] quickSort (double a[]){
		 //todo: implement the sort
    	if (a!=null) {
		recursiveQuickSort(a,0,a.length-1);
		return a;
    	}
    	else {
    		return null;
    	}
    }//end quicksort

    private static void recursiveQuickSort(double[] a, int lo, int hi) {
		// TODO Auto-generated method stub
		if(hi<=lo) {
			return;
		}
		int pivotPos=partition(a,lo,hi);
		recursiveQuickSort(a,lo,pivotPos-1);
		recursiveQuickSort(a,pivotPos+1,hi);
	}

	private static int partition(double[] a, int lo, int hi) {
		// TODO Auto-generated method stub
		double pivot = a[hi];
		 int i = lo-1; 
		 for (int j=lo; j<hi; j++) {
			 if (a[j] <= pivot) {
				 i++;
				 double temp = a[i];
				 a[i] = a[j];
				 a[j] = temp;
			 }
		 }
		 double temp = a[i+1];
		 a[i+1] = a[hi];
		 a[hi] = temp;
		 return i+1;
	}

	/**
     * Sorts an array of doubles using Merge Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order
     *
     */
    /**
     * Sorts an array of doubles using iterative implementation of Merge Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     *
     * @param a: An unsorted array of doubles.
     * @return after the method returns, the array must be in ascending sorted order.
     */

    static double[] mergeSort(double a[]) {
		//todo: implement the sort
    	//TopDown recursive implementation 
    	if(a!=null) {
    	double[] aux= new double[a.length];
        sort(a,aux,0,a.length-1);
    	return a;
    	}
    	else
    	{
    		return null;
    	}
    }//end mergesort
    
    private static void sort(double[] a, double[] aux, int lo, int hi) {
		// TODO Auto-generated method stub
    	if(hi<=lo)return;
    	int mid= lo+(hi-lo)/2;
    	sort(a,aux,lo,mid);
    	sort(a,aux,mid+1,hi);
    	merge(a,aux,lo,mid,hi);
	}

	private static void merge(double[] a, double[] aux, int lo, int mid, int hi) {
		// TODO Auto-generated method stub
		for(int k=lo;k<=hi;k++) {
			aux[k]=a[k];
		}
		int i=lo , j=mid+1;
		for(int k=lo;k<=hi;k++) {
			if(i>mid) a[k]=aux[j++];
			else if(j>hi) a[k]=aux[i++];
			else if(aux[j]<aux[k]) a[k]=aux[j++];
			else a[k]=aux[i++];
		}
	}

	public static void main(String[] args) {

        //todo: do experiments as per assignment instructions
		/*
		Path path = Paths.get("./src/numbers10000.txt");
        double [] a = new double [10000];
        int i = 0;
        Scanner arr = null;
        try {
            arr = new Scanner(path);
            while(arr.hasNext()) {
               String str = arr.next();
               double val = Double.parseDouble(str);
               a[i++] = val;
              // System.out.println(val);
           }
           arr.close();
         } catch (IOException e){
           e.printStackTrace();
        }
        long [] time = new long[3];
        for(int j = 0; j<3; j++) {
           long start = System.nanoTime();
        //   System.out.println(a.length);
            a = mergeSort(a);
           long end = System.nanoTime();
          //  for(int k=0;k<a.length-1;k++)
          //  {
           // System.out.println(a[k]);
          //  }
           time[j] =(end - start);
           System.out.println(time[j] + " in nanoseconds");
       }
       long avg = (time[0] + time[1] + time[2]) / 3000000 ;
        System.out.println("average running times : " + avg + " in milliseconds");
		*/
      }
 
 }//end class
