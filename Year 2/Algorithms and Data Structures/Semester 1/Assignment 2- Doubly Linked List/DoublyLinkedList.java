
import java.util.Iterator;
import java.util.ListIterator;
import java.util.NoSuchElementException;

// -------------------------------------------------------------------------
/**
 *  This class contains the methods of Doubly Linked List.
 *
 *  @author  Khushboo Jain
 *  @version 09/10/18 11:13:22
 */


/**
 * Class DoublyLinkedList: implements a *generic* Doubly Linked List.
 * @param <T> This is a type parameter. T is used as a class name in the
 * definition of this class.
 *
 * When creating a new DoublyLinkedList, T should be instantiated with an
 * actual class name that extends the class Comparable.
 * Such classes include String and Integer.
 *
 * For example to create a new DoublyLinkedList class containing String data: 
 *    DoublyLinkedList<String> myStringList = new DoublyLinkedList<String>();
 *
 * The class offers a toString() method which returns a comma-separated sting of
 * all elements in the data structure.
 * 
 * This is a bare minimum class you would need to completely implement.
 * You can add additional methods to support your code. Each method will need
 * to be tested by your jUnit tests -- for simplicity in jUnit testing
 * introduce only public methods.
 */
class DoublyLinkedList<T extends Comparable<T>>
{

    /**
     * private class DLLNode: implements a *generic* Doubly Linked List node.
     */
    private class DLLNode
    {
        public final T data; // this field should never be updated. It gets its
                             // value once from the constructor DLLNode.
        public DLLNode next;
        public DLLNode prev;
    
        /**
         * Constructor
         * @param theData : data of type T, to be stored in the node
         * @param prevNode : the previous Node in the Doubly Linked List
         * @param nextNode : the next Node in the Doubly Linked List
         * @return DLLNode
         */
        public DLLNode(T theData, DLLNode prevNode, DLLNode nextNode) 
        {
          data = theData;
          prev = prevNode;
          next = nextNode;
        }
    }

    // Fields head and tail point to the first and last nodes of the list.
    private DLLNode head, tail;

    /**
     * Constructor of an empty DLL
     * @return DoublyLinkedList
     */
    public DoublyLinkedList() 
    {
      head = null;
      tail = null;
    }

    /**
     * We assume doubly linked list if not empty are N elements long and calls to methods(from one method to another),initializations 
     * and comparisons have a constant running time theta(1)
     * Tests if the doubly linked list is empty
     * @return true if list is empty, and false otherwise
     *
     * Worst-case asymptotic running time cost: theta(1)
     *
     * Justification:
     *  It has an asymptotic running time of theta (1) which is constant running time
     *  as there is no loop or iteration taking place
     */
    public boolean isEmpty()
    {
      // TODO
    	
    		return (head==null);
    }

    /**
     * Inserts an element in the doubly linked list
     * @param pos : The integer location at which the new data should be
     *      inserted in the list. We assume that the first position in the list
     *      is 0 (zero). If pos is less than 0 then add to the head of the list.
     *      If pos is greater or equal to the size of the list then add the
     *      element at the end of the list.
     * @param data : The new data of class T that needs to be added to the list
     * @return none
     *
     * Worst-case asymptotic running time cost: theta(N)
     *
     * Justification:
     * The first if and else if condition have the asymptotic running time of theta (1) as there is no 
     * for loop / iteration taking place , initialization and comaprison and method calls have theta(1) running time 
     * The else contains a for loop which iterates through N elements of the double linked list , supposedly
     * it has N elements 
     * So as we know  the for loop(linear order of growth) has the running time is theta (N)
     * So,  the total running time cost is Theta(1) + Theta (N) which gives us Theta(N) as we only keep the 
     * highest time taken
     *  TODO
     */
    public void insertBefore( int pos, T data ) 
    {
      //TODO
    	DLLNode newNode;
    	if(isEmpty())
    	{
    		newNode= new DLLNode(data, null, null);
    		this.head=newNode;
    		this.tail=newNode;
    	}
    	else
    	{
    		if (pos<=0)
    		{
    		   newNode= new DLLNode(data,null,head);
    		   head.prev=newNode;
    		   head=newNode;
    		}
    		else if (pos>=sizeList())
    		{
    			newNode= new DLLNode(data,tail,null);
    			tail.next=newNode;
    			tail=newNode;
    		}
    		else
    		{
    			DLLNode tmpNode=this.head;
    			
    			for(int i=0; i<pos;i++)
    			{
    				tmpNode=tmpNode.next;
    			}
    			newNode= new DLLNode(data,tmpNode.prev,tmpNode);
    		
    			tmpNode.prev.next=newNode;
    			tmpNode.prev=newNode;
    		}
    	}
    }

    /**
     * Returns the data stored at a particular position
     * @param pos : the position
     * @return the data at pos, if pos is within the bounds of the list, and null otherwise.
     *
     * Worst-case asymptotic running time cost: Theta (N)
     *
     * Justification:
     * The if statement , initializations and method calls  has an asymptotic constant run time of theta(1) 
     * The else contains a for loop which iterates through N elements of the double linked list , supposedly
     * it has N elements 
     * So as we know  the while loop(linear order of growth) has the running time is theta (N)
     * So,  the total running time cost is Theta(1) + Theta (N) which gives us Theta(N) as we only consider
     * the highest time taken 
     *  TODO
     *
     */
    public T get(int pos) 
    {
      //TODO
    	
    	if (!isEmpty()) {
			if (pos >= sizeList())
				return null;
			else if (pos < 0)
				return null;
			else {
				DLLNode tempNode = this.head;
				int i = 0;
				while (i < pos) {
					tempNode = tempNode.next;
					i++;
				}
				return tempNode.data;
			}
		} else
			return null;

     
   }

    /**
     * Deletes the element of the list at position pos.
     * First element in the list has position 0. If pos points outside the
     * elements of the list then no modification happens to the list.
     * @param pos : the position to delete in the list.
     * @return true : on successful deletion, false : list has not been modified. 
     *
     * Worst-case asymptotic running time cost: theta (N)
     *
     * Justification:
     * Each if statement or initialization , method calls  takes a constant run time of theta(1)
     * And we loop N times through the double linked list to delete the element at the desired position
     * So considering the worst case we need to loop through N times to delete the element suppose its 'N' position
     * So the worst case running time is theta(N)
     * 
     *  
     *  
     */
    public boolean deleteAt(int pos) 
    {
      //TODO
    	boolean deleted = false;
    	int size = this.sizeList();
    	if(pos < size && pos >= 0)
    	{
    		//find the element we are trying to delete
    		DLLNode currentNode = this.head;
    		if(currentNode.next != null){
    			for(int index = 0; index < pos; index++){
            		currentNode = currentNode.next;
            	}
    		}
    		
    		if(size == 1) {
    			this.head = null;
    			this.tail = null;
    			deleted = true;
    		}
    		else if(size >= 2) {
    			if(currentNode.prev != null) {
    				currentNode.prev.next = currentNode.next;
    			}
    			if(currentNode.next != null) {
    				currentNode.next.prev = currentNode.prev;
    			}
    			if(currentNode == this.head) {
    				this.head = currentNode.next;
    				if(size == 2) {
    					this.head.next = null;
    					this.tail = this.head;
    				}
    			}
    			if(currentNode == this.tail) {
    				this.tail = currentNode.prev;
    				if(size == 2) {
    					this.tail.prev = null;
    					this.head = this.tail;
    				}
    			}
    			currentNode = null;
    			deleted = true;
    		}
    	}
    	return deleted;
    } 


    /**
     * Reverses the list.
     * If the list contains "A", "B", "C", "D" before the method is called
     * Then it should contain "D", "C", "B", "A" after it returns.
     *
     * Worst-case asymptotic running time cost: theta(N)
     *
     * Justification:
     * All initializations and comparison have a constant running time of theta(1)
     *While  Loops  N times through the list assuming the size of the double linked list is N , assuming 
     * double linked list is N in size and all the statements inside while loop have constant running time 
     * So, as we see the running time is theta(N) as we keep the highest running time of the worst case
     * 
     */
    public void reverse()
    {
      //TODO
    	DLLNode tempNode=null;
    	DLLNode currentNode=head;
    	
    	while(currentNode !=null)
    	{
    		tempNode=currentNode.prev;
    		currentNode.prev=currentNode.next;
    		currentNode.next=tempNode;
    		currentNode=currentNode.prev;
    	}
    	if(tempNode!=null)
    	{
    		head=tail;
    		head=tempNode.prev;
    	}
    }

    /**
     * Removes all duplicate elements from the list.
     * The method should remove the _least_number_ of elements to make all elements unique.
     * If the list contains "A", "B", "C", "B", "D", "A" before the method is called
     * Then it should contain "A", "B", "C", "D" after it returns.
     * The relative order of elements in the resulting list should be the same as the starting list.
     *
     * Worst-case asymptotic running time cost: theta(N^2 )
     *
     * Justification:
     *  The two for loops (linear running time ) go N times through the list each being  N  , both being N * N = N^2
     * All the initializations and comparison have a constant running time theta (1)
     * so it is theta (1)*(N) *(N)= theta (N^2) 
     *  
     */
     public void makeUnique()
    {
      //TODO
    	 if (!isEmpty()) {
 			DLLNode tempNode = head;
 			DLLNode tempNode2 = null;
 			T data = null;
 			T data2 = null;
 			for (int i = 0; i <sizeList(); i++) {
 				tempNode2 = head;
 				data = tempNode.data;
 				for (int j = 0; j < sizeList(); j++) {
 					data2 = tempNode2.data;
 					if (data == data2 && i != j) {
 						tempNode2.prev.next = tempNode2.next;
 						if (tempNode2.next != null) {
 							tempNode2.next.prev = tempNode2.prev;
 						}
 					}
 					tempNode2 = tempNode2.next;
 				}
 				tempNode = tempNode.next;
 			}
 		}
    }
     
     
     /**
      * This method returns the size/number of elements in the data structure.
      *
      * 
      *
      * Worst-case asymptotic running time cost: theta(N)
      *
      * Justification:
      * All initializations and comparisons have a constant run time of theta (1)
      * The while loop in the else loop iterates N times through the double linked list(linear run time)
      * Giving us an asymptotic run time of theta (N) as we considered the highest running time (theta(1) + theta(N) =theta(N) )
      * 
      *  TODO
      *  
      */
     public int sizeList()
     {
    	 if (isEmpty())
 			return 0;
 		else {
 			int i = 1;
 			DLLNode tempNode = this.head;
 			while (tempNode.next != null) {
 				i++;
 				tempNode = tempNode.next;
 			}
 			return i;
 		}
     }


    /*----------------------- STACK API 
     * If only the push and pop methods are called the data structure should behave like a stack.
     */

    /**
     * This method adds an element to the data structure.
     * How exactly this will be represented in the Doubly Linked List is up to the programmer.
     * @param item : the item to push on the stack
     *
     * Worst-case asymptotic running time cost: theta(1)
     *
     * Justification:
     * All the initializations and comparisons , method calls  have a constant running time of theta (1)
     *  TODO
     */
    public void push(T item) 
    {
      //TODO
    	DLLNode newNode= new DLLNode(item ,null,head);
    	if(!isEmpty())
    	{
    		this.head.prev=newNode;
    		head=newNode;
    	}
    	else
    	{
    		head=newNode;
    	}
    }

    /**
     * This method returns and removes the element that was most recently added by the push method.
     * @return the last item inserted with a push; or null when the list is empty.
     *
     * Worst-case asymptotic running time cost: Theta(1)
     *
     * Justification:
     *  All the initializations, method calls and comparisons have a constant running time of theta (1)
     *  TODO
     */
    public T pop() 
    {
      //TODO
    	if(!isEmpty())
    	{
    		DLLNode temp=head;
    		if(temp.next!=null)
    		{
    			temp.next.prev=temp.prev;
    		}
    		else
    		{
    			tail=temp.prev;
    		}
    		head=temp.next;
    		return temp.data;
    	}
      return null;
    }

    /*----------------------- QUEUE API
     * If only the enqueue and dequeue methods are called the data structure should behave like a FIFO queue.
     */
 
    /**
     * This method adds an element to the data structure.
     * How exactly this will be represented in the Doubly Linked List is up to the programmer.
     * @param item : the item to be enqueued to the stack
     *
     * Worst-case asymptotic running time cost: Theta(1)
     *
     * Justification:
     *  All the initializations and comparisons, method calls  have a constant running time of theta (1)
     *  TODO
     */
    public void enqueue(T item) 
    {
      //TODO
    DLLNode newNode= new DLLNode(item,tail,null);
    if(!isEmpty())
    {
    	   tail.next=newNode;
    	   tail=newNode;
    	
    }
    else
    {
    	head=newNode;
    	tail=newNode;
    }
    	
    }

     /**
     * This method returns and removes the element that was least recently added by the enqueue method.
     * @return the earliest item inserted with an equeue; or null when the list is empty.
     *
     * Worst-case asymptotic running time cost: Theta(1)
     *
     * Justification: All the initializations and comparisons, method calls  have a constant running time of theta (1)
     *  TODO
     */
    public T dequeue() 
    {
      //TODO
    	if(!isEmpty())
    	{
    		T dequeued = head.data;
    		if(head.next!=null)
    		{
    			head.next.prev=null;
    			head=head.next;
    		}
    		else
    		{
    			head=null;
    			tail=null;
    		}
    		return dequeued;
    	}
      return null;
    }
 

    /**
     * @return a string with the elements of the list as a comma-separated
     * list, from beginning to end
     *
     * Worst-case asymptotic running time cost:   Theta(n)
     *
     * Justification:
     *  We know from the Java documentation that StringBuilder's append() method runs in Theta(1) asymptotic time.
     *  We assume all other method calls here (e.g., the iterator methods above, and the toString method) will execute in Theta(1) time.
     *  Thus, every one iteration of the for-loop will have cost Theta(1).
     *  Suppose the doubly-linked list has 'n' elements.
     *  The for-loop will always iterate over all n elements of the list, and therefore the total cost of this method will be n*Theta(1) = Theta(n).
     */
    public String toString() 
    {
      StringBuilder s = new StringBuilder();
      boolean isFirst = true; 

      // iterate over the list, starting from the head
      for (DLLNode iter = head; iter != null; iter = iter.next)
      {
        if (!isFirst)
        {
          s.append(",");
        } else {
          isFirst = false;
        }
        s.append(iter.data.toString());
      }

      return s.toString();
    }
    
   

}

