import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

//-------------------------------------------------------------------------
/**
 *  Test class for Doubly Linked List
 *
 *  @author  Khushboo jain
 *  @version 13/10/16 18:15
 */
@RunWith(JUnit4.class)
public class DoublyLinkedListTest
{
    //~ Constructor ........................................................
    @Test
    public void testConstructor()
    {
      new DoublyLinkedList<Integer>();
    }

    //~ Public Methods ........................................................

    // ----------------------------------------------------------
    /**
     * Check if the insertBefore works
     */
    @Test
    public void testInsertBefore()
    {
        // test non-empty list
        DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);
        testDLL.insertBefore(1,2);
        testDLL.insertBefore(2,3);

        testDLL.insertBefore(0,4);
        assertEquals( "Checking insertBefore to a list containing 3 elements at position 0", "4,1,2,3", testDLL.toString() );
        testDLL.insertBefore(1,5);
        assertEquals( "Checking insertBefore to a list containing 4 elements at position 1", "4,5,1,2,3", testDLL.toString() );
        testDLL.insertBefore(2,6);       
        assertEquals( "Checking insertBefore to a list containing 5 elements at position 2", "4,5,6,1,2,3", testDLL.toString() );
        testDLL.insertBefore(-1,7);        
        assertEquals( "Checking insertBefore to a list containing 6 elements at position -1 - expected the element at the head of the list", "7,4,5,6,1,2,3", testDLL.toString() );
        testDLL.insertBefore(7,8);        
        assertEquals( "Checking insertBefore to a list containing 7 elemenets at position 8 - expected the element at the tail of the list", "7,4,5,6,1,2,3,8", testDLL.toString() );
        testDLL.insertBefore(700,9);        
        assertEquals( "Checking insertBefore to a list containing 8 elements at position 700 - expected the element at the tail of the list", "7,4,5,6,1,2,3,8,9", testDLL.toString() );

        // test empty list
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);        
        assertEquals( "Checking insertBefore to an empty list at position 0 - expected the element at the head of the list", "1", testDLL.toString() );
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(10,1);        
        assertEquals( "Checking insertBefore to an empty list at position 10 - expected the element at the head of the list", "1", testDLL.toString() );
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(-10,1);        
        assertEquals( "Checking insertBefore to an empty list at position -10 - expected the element at the head of the list", "1", testDLL.toString() );
     }

    // TODO: add more tests here. Each line of code in DoublyLinkedList.java should
    // be executed at least once from at least one test.
     @Test 
     public void testisEmpty()
     {
         // test empty list
         DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
         assertEquals( "Checking is an empty list or not - expected result true", true, testDLL.isEmpty());

         // test non empty list
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);        
         assertEquals("Checking is an empty list or not - expected result false", false, testDLL.isEmpty());
      }

     
     @Test 
     public void testget()
     {
         // test empty list
         DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
         assertEquals( "Checking to get element at position 6 in - expected result null", null, testDLL.get(6));

         // test non empty list , 
         //to get element outside the bounds so expecting null
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);        
         assertEquals("Checking to get element at position 4 - expected result null", null, testDLL.get(5));
         
         
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);        
         assertEquals("Checking to get element at position -1 - expected result null", null, testDLL.get(-1));
         
       //to get element within the bounds so expecting a valid result 
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);        
         assertEquals("Checking to get element at position 2 - expected result 3", 3, (int)testDLL.get(2));
        
      }
     
     
     @Test
     public void testDeleteAt()
     {
    	 //test empty list
    	 DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
         assertEquals( "Checking whether element at given pos is deleted  or not - expected result false", false, testDLL.deleteAt(4)); 
         
         // test non empty list , 
         //to delete element outside the bounds 
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);        
         assertEquals("Checking  whether element at given pos is deleted  or not  - expected result false", false, testDLL.deleteAt(5));
         
         
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);        
         assertEquals("Checking  whether element at given pos is deleted  or not  - expected result false", false, testDLL.deleteAt(-6));
         
         //to delete element within the bounds(in the middle) 
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);        
         assertEquals("Checking  whether element at given pos is deleted  or not  - expected result true", true, testDLL.deleteAt(1));
         
         //to delete element within the bounds(at head)
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);        
         assertEquals("Checking  whether element at given pos is deleted  or not  - expected result true", true, testDLL.deleteAt(0));
         
         
         //to delete element within the bounds(at tail)
           testDLL = new DoublyLinkedList<Integer>();
           testDLL.insertBefore(0,1);       
           testDLL.insertBefore(1,2);        
           testDLL.insertBefore(2,3);        
           assertEquals("Checking  whether element at given pos is deleted  or not  - expected result true", true, testDLL.deleteAt(2));
           
           
         //to delete element within the bounds(single element list)
           testDLL = new DoublyLinkedList<Integer>();
           testDLL.insertBefore(0,1);              
           assertEquals("Checking  whether element at given pos is deleted  or not  - expected result true", true, testDLL.deleteAt(0));
             
         //to delete an element from head of 2 elements list 
           testDLL = new DoublyLinkedList<Integer>();
           testDLL.insertBefore(0,1);       
           testDLL.insertBefore(1,2);              
           assertEquals("Checking  whether element at given pos is deleted  or not  - expected result true", true, testDLL.deleteAt(0));
           
           
         //to delete an element from tail of 2 elements list 
           testDLL = new DoublyLinkedList<Integer>();
           testDLL.insertBefore(0,1);       
           testDLL.insertBefore(1,2);              
           assertEquals("Checking  whether element at given pos is deleted  or not  - expected result true", true, testDLL.deleteAt(1));
           
     }
     
     @Test
     public void testreverse()
     {
    	//test empty list
    	 DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
    	 testDLL.reverse();
         assertEquals("Checking whether order was reversed  or not - expected no change","",testDLL.toString()); 
        
         
       //test non empty list 
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);  
         testDLL.reverse();
         assertEquals("Checking whether order was reversed  or not - expected  change","3,2,1",testDLL.toString()); 
        
         
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3); 
         testDLL.insertBefore(3,4); 
         testDLL.reverse();
         assertEquals("Checking whether order was reversed  or not - expected  change","4,3,2,1",testDLL.toString()); 
        
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.reverse();
         assertEquals("Checking whether order was reversed  or not - expected no change","1",testDLL.toString()); 
        
     }
     
     @Test
     public void testmakeUnique()
     {
    	//test empty list
    	 DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
    	 testDLL.makeUnique();
         assertEquals("Checking whether is unique or not - expected no change","",testDLL.toString()); 
        
         
         //test non empty list
         //non unique
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);
         testDLL.insertBefore(3,1);
         testDLL.makeUnique();
         assertEquals("Checking whether is unique  or not - expected  change","1,2,3",testDLL.toString()); 
        
         
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);
         testDLL.insertBefore(3,2);
         testDLL.makeUnique();
         assertEquals("Checking whether is unique or not - expected  change","1,2,3",testDLL.toString()); 
         
        
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);
         testDLL.insertBefore(3,3);
         testDLL.makeUnique();
         assertEquals("Checking whether is unique  or not - expected  change","1,2,3",testDLL.toString()); 
         
         //unique list already
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);  
         testDLL.makeUnique();
         assertEquals("Checking whether is unique  or not - expected no change","1,2,3",testDLL.toString()); 
     }
     
     @Test
     public void testPush()
     {
    	//test empty list
    	 DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
    	 testDLL.push(1);
    	 assertEquals("Checking if value pushed or not - expected change","1",testDLL.toString()); 
         
    	 //test non empty list 
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);  
         testDLL.push(10);
         assertEquals("Checking if value pushed or not - expected change ","10,1,2,3",testDLL.toString()); 
        
     }
     
     
     @Test
     public void testPop() {
     	//test empty list
     	DoublyLinkedList<Integer>testDLL = new DoublyLinkedList<Integer>();
     	assertEquals("Checking pop to a empty list - expecting null",null,testDLL.pop());
     	
     	//test one element list
     	testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);
         assertEquals("Checking pop to a one element list - expecting 1",1, (int)testDLL.pop());
         
         
        
     	//test non empty list 
     	testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);
         testDLL.insertBefore(1,2);
         testDLL.insertBefore(2,3);
     	assertEquals("Checking pop to a non-empty list - expecting 1",1, (int)testDLL.pop());
     	
     	
     }
     
     @Test
     public void testEnqueque()
     {
    	//test empty list
    	 DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
    	 testDLL.enqueue(1);
    	 assertEquals("Checking if value enqueued or not - expected change","1",testDLL.toString()); 
         
    	 //test non empty list 
         testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);       
         testDLL.insertBefore(1,2);        
         testDLL.insertBefore(2,3);  
         testDLL.enqueue(10);
         assertEquals("Checking if value enqueued or not - expected change ","1,2,3,10",testDLL.toString()); 
        
     }
     
     @Test
     public void testDequeue() {
     	//test empty list
     	DoublyLinkedList<Integer>testDLL = new DoublyLinkedList<Integer>();
     	testDLL.dequeue();
     	assertEquals("Checking dequeue to a empty list - expecting null",null,testDLL.dequeue());
     	
     	//test one element list 
     	testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);
         assertEquals("Checking dequeue to a one elem list - expecting ",1,(int)testDLL.dequeue());
     	
     	//test non empty list 
     	testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);
         testDLL.insertBefore(1,2);
         testDLL.insertBefore(2,3);
         assertEquals("Checking dequeue to a non-empty list - expecting ",1,(int)testDLL.dequeue());
     }
     
     @Test
     public void testsizeList()
     {
    	 DoublyLinkedList<Integer>testDLL = new DoublyLinkedList<Integer>();
    	 //test non empty list 
  
          testDLL.insertBefore(0,1);
          testDLL.insertBefore(1,2);
          testDLL.insertBefore(2,3);
          assertEquals("Checking size of list - expecting 3 ",3,(int)testDLL.sizeList());
      
     }
     
    
     @Test
     public void sampleTest1() {
     	DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
         testDLL.insertBefore(0,1);
         testDLL.insertBefore(1,2);
         System.out.println(testDLL.toString());
         assertEquals("Checking deleteAt(0) on 2-element list deletes the head element from the list-expecting true",true, testDLL.deleteAt(0));
         System.out.println(testDLL.toString());
     }
     

}

