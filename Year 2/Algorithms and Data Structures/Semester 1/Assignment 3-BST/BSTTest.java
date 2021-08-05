import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

//-------------------------------------------------------------------------
/**
 *  Test class for Doubly Linked List
 *
 *  @version 3.1 09/11/15 11:32:15
 *
 *  @author  TODO
 */

@RunWith(JUnit4.class)
public class BSTTest
{
  
  //TODO write more tests here.

  
  /** <p>Test {@link BST#prettyPrintKeys()}.</p> */
      
 @Test
 public void testPrettyPrint() {
     BST<Integer, Integer> bst = new BST<Integer, Integer>();
     assertEquals("Checking pretty printing of empty tree",
             "-null\n", bst.prettyPrintKeys());
      
                          //  -7
                          //   |-3
                          //   | |-1
                          //   | | |-null
     bst.put(7, 7);       //   | |  -2
     bst.put(8, 8);       //   | |   |-null
     bst.put(3, 3);       //   | |    -null
     bst.put(1, 1);       //   |  -6
     bst.put(2, 2);       //   |   |-4
     bst.put(6, 6);       //   |   | |-null
     bst.put(4, 4);       //   |   |  -5
     bst.put(5, 5);       //   |   |   |-null
                          //   |   |    -null
                          //   |    -null
                          //    -8
                          //     |-null
                          //      -null
     
     String result = 
      "-7\n" +
      " |-3\n" + 
      " | |-1\n" +
      " | | |-null\n" + 
      " | |  -2\n" +
      " | |   |-null\n" +
      " | |    -null\n" +
      " |  -6\n" +
      " |   |-4\n" +
      " |   | |-null\n" +
      " |   |  -5\n" +
      " |   |   |-null\n" +
      " |   |    -null\n" +
      " |    -null\n" +
      "  -8\n" +
      "   |-null\n" +
      "    -null\n";
     assertEquals("Checking pretty printing of non-empty tree", result, bst.prettyPrintKeys());
     }

  
     /** <p>Test {@link BST#delete(Comparable)}.</p> */
     @Test
     public void testDelete() {
         BST<Integer, Integer> bst = new BST<Integer, Integer>();
         bst.delete(1);
         assertEquals("Deleting from empty tree", "()", bst.printKeysInOrder());
         
         bst.put(7, 7);   //        _7_
         bst.put(8, 8);   //      /     \
         bst.put(3, 3);   //    _3_      8
         bst.put(1, 1);   //  /     \
         bst.put(2, 2);   // 1       6
         bst.put(6, 6);   //  \     /
         bst.put(4, 4);   //   2   4
         bst.put(5, 5);   //        \
                          //         5
         
         assertEquals("Checking order of constructed tree",
                 "(((()1(()2()))3((()4(()5()))6()))7(()8()))", bst.printKeysInOrder());
         
         bst.delete(9);
         assertEquals("Deleting non-existent key",
                 "(((()1(()2()))3((()4(()5()))6()))7(()8()))", bst.printKeysInOrder());
 
         bst.delete(8);
         assertEquals("Deleting leaf", "(((()1(()2()))3((()4(()5()))6()))7())", bst.printKeysInOrder());
 
         bst.delete(6);
         assertEquals("Deleting node with single child",
                 "(((()1(()2()))3(()4(()5())))7())", bst.printKeysInOrder());
 
         bst.delete(3);
         assertEquals("Deleting node with two children",
                 "(((()1())2(()4(()5())))7())", bst.printKeysInOrder());
         bst.delete(1);
         assertEquals("Deleting node ",
                 "((()2(()4(()5())))7())", bst.printKeysInOrder());
         
         
         BST<Integer, Integer> bst2 = new BST<Integer, Integer>();
 		bst2.put(6,6);
 		bst2.put(3,3);
 		bst2.put(8, 8);
 		bst2.put(9,9);
 		bst2.delete(8);
 		assertEquals("Deleting key 3 where left branch is null","((()3())6(()9()))", bst2.printKeysInOrder());
 		
     }
     
     @Test
     public void testheight() {
    	   BST<Integer, Integer> bst = new BST<Integer, Integer>();
    	   assertEquals("Checking height of an empty tree", -1 , bst.height());
           bst.put(7, 7);   //        _7_
           bst.put(8, 8);   //      /     \
           bst.put(3, 3);   //    _3_      8
           bst.put(1, 1);   //  /     \
           bst.put(2, 2);   // 1       6
           bst.put(6, 6);   //  \     /
           bst.put(4, 4);   //   2   4
           bst.put(5, 5);   //        \
                            //         5
           assertEquals("Checking height of constructed tree", 4, bst.height());
           
           BST<Integer, Integer> bst1 = new BST<Integer, Integer>();
           bst1.put(1,7);      // _7_
           
           assertEquals("Checking height of a single element tree", 0, bst1.height());
     }
     
     @Test
     public void testmedian() {
    	  BST<Integer, Integer> bst = new BST<Integer, Integer>();
   	       assertEquals("Checking median of an empty tree", null , bst.median());
   	       
   	    bst.put(7, 7);   //        _7_
        bst.put(8, 8);   //      /     \
        bst.put(3, 3);   //    _3_      8
        bst.put(1, 1);   //  /     \
        bst.put(2, 2);   // 1       6
        bst.put(6, 6);   //  \     /
        bst.put(4, 4);   //   2   4
        bst.put(5, 5);   //        \
                         //         5
        assertEquals("Checking median of constructed tree", bst.get(4) , bst.median());
   	       //System.out.print(bst.get(4));
       
        BST<Integer, Integer> bst2 = new BST<Integer, Integer>();
        bst2.put(1, 1); // 6
		bst2.put(3, 3); // / \
		bst2.put(4, 4); // 3 8
		bst2.put(6, 6);// / \ / \
		bst2.put(7, 7);// 1 4 7 9
		bst2.put(8, 8);
		bst2.put(9, 9);

		assertEquals("Checking median of tree", bst2.get(6), bst2.median());
		
        
     }
     
     @Test
     public void Testprintkeysinorder() {
    	 BST<Integer, Integer> bst = new BST<Integer, Integer>();
 	       assertEquals("Printing in order", "()" , bst.printKeysInOrder());
 	        bst.put(1, 1); // 6
 			bst.put(3, 3); // / \
 			bst.put(4, 4); // 3 8
 			bst.put(6, 6);// / \ / \
 			bst.put(7, 7);// 1 4 7 9
 			bst.put(8, 8);
 			bst.put(9, 9);

 			assertEquals("Printing in order",  "(()1(()3(()4(()6(()7(()8(()9())))))))", bst.printKeysInOrder());
 			
     }
     
     @Test
     public void Testcontains() {
     BST<Integer, Integer> bst = new BST<Integer, Integer>();
	   assertEquals("Checking contains on empty tree", false , bst.contains(4));
     bst.put(7, 7);   //        _7_
     bst.put(8, 8);   //      /     \
     bst.put(3, 3);   //    _3_      8
     bst.put(1, 1);   //  /     \
     bst.put(2, 2);   // 1       6
     bst.put(6, 6);   //  \     /
     bst.put(4, 4);   //   2   4
     bst.put(5, 5);   //        \
                      //         5
     assertEquals("Checking contains within a constructed tree", true , bst.contains(4));
     assertEquals("Checking contains within a constructed tree", false , bst.contains(10));
     }
     
     @Test
 	public void testPut() {
 		BST<Integer, Integer> bst = new BST<Integer, Integer>();
 		// test null value
 		bst.put(6, 6);
 		bst.put(3, 3);
 		bst.put(8, 8);
 		bst.put(1, 1);
 		bst.put(4, 4);
 		bst.put(7, 7);
 		bst.put(9, 9);
 		
 		bst.put(9,10);
 		assertEquals("Testing put ",10,(int)bst.get(9));
 		
 		bst.put(4, null);
 		assertEquals("Testing put with null value ","(((()1())3())6((()7())8(()9())))", bst.printKeysInOrder());
 		
 		
 	}
}

