package assignGrades;

import java.util.Scanner;

public class AssignGrades {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner input= new Scanner(System.in);
		System.out.print("enter the number of students");
		int numOfStudents=input.nextInt();
		
		double [] marks = new double[numOfStudents];
		System.out.print("enter the marks");
		for (int index=0;index<numOfStudents;index++)
		{
			marks[index]=input.nextDouble();
		}
		findBest(marks);
		calcGrade(marks);
		
	}
    public static double findBest(double[] marks)
    {
    	double best=0.0;
    	double max = marks[0];
    	for (int index=0;index<=marks.length-1;index++)
		{
    	   if (max<=marks[index])
    	   {
    		   max=marks[index];
    		   best= max;
    	    }
		}
		return best;
    }
    public static void calcGrade(double[]marks)
    {
        String grade =" ";
        double bestScore=findBest(marks);
		for (int index=0;index<=marks.length-1;index++)
		{ 
		  if (marks[index] >= (bestScore - 5))
		  {
			  grade ="A" ;
		  }
		  else if(((bestScore-5)>=marks[index]) &&(marks[index]>= (bestScore - 10)))
		  {
			  grade="B";
		  }
		  else  if(((bestScore-10)>=marks[index]) && (marks[index] >= (bestScore - 15)))
		  {
			  grade="C";
		  }
		  else
		  {
			  grade="D";
		  }
		  System.out.println("Student" + index + "score is "+ marks[index]+ " and grade is"+ grade);
		}
		

    	
    }

}
