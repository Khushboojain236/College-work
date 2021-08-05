import static org.junit.Assert.*;

import org.junit.Test;
import static junit.framework.TestCase.assertEquals;

public class CompetitionTests {

    @Test
    public void testDijkstraConstructor() {

        //TODO
    	 new CompetitionDijkstra("tinyEWD.txt", 56, 60, 70);
    }

    @Test
    public void testFWConstructor() {
        //TODO
    	 new CompetitionFloydWarshall("tinyEWD.txt", 56, 60, 70);
    }
    
    
    @Test
    public void testDijTiming() {	 
    	
    	 int minTime = new CompetitionDijkstra(null, 62, 83, 94).timeRequiredforCompetition();
         assertEquals("text on null file", minTime, -1);
         
         int Time = new CompetitionDijkstra("tinyEWD.txt", 0, 0, 0).timeRequiredforCompetition();
         assertEquals("text on null file", Time, -1);
         
         int minTime1= new CompetitionDijkstra("tinyEWD.txt",50,60,70).timeRequiredforCompetition();
         assertEquals("testing graph",minTime1,38);
         
        //times-out on Webcat works on local machine 
        // int minTime2 = new CompetitionDijkstra("1000EWD.txt", 62, 83, 94).timeRequiredforCompetition();
        // assertEquals("test on 1000EWD", minTime2, 23);
         
         int minTime3 = new CompetitionDijkstra("tinyEWD.txt", 62, 83, 94).timeRequiredforCompetition();
         assertEquals("test on 1000EWD", minTime3, 30);
         

         int minTime4 = new CompetitionDijkstra("tinyEWD.txt", 1, 56, 4).timeRequiredforCompetition();
         assertEquals("test too slow", minTime4, -1);
         
         
         int minTime5 = new CompetitionDijkstra("tinyEWD.txt", 109, 200, 64).timeRequiredforCompetition();
         assertEquals("test too fast", minTime5, -1);
         
         int minTime6 = new CompetitionDijkstra("tinyEWD.txt", 56, 20, 78).timeRequiredforCompetition();
         assertEquals("test too slow", minTime6, -1);
         
         int minTime7 = new CompetitionDijkstra("tinyEWD.txt", 56, 84, 2).timeRequiredforCompetition();
         assertEquals("test too slow", minTime7, -1);
         
         int mintime8 = new CompetitionDijkstra("input-C.txt", 62, 83, 94).timeRequiredforCompetition();
         assertEquals("test on input-C", mintime8, -1);
         
         int minTime9 = new CompetitionDijkstra("tinyEWD.txt", 90, 200, 64).timeRequiredforCompetition();
         assertEquals("test too fast", minTime9, -1);
         
         int minTime10 = new CompetitionDijkstra("tinyEWD.txt", 90,66, 200).timeRequiredforCompetition();
         assertEquals("test too fast", minTime10, -1);

         int minTime11 = new CompetitionDijkstra("input-J.txt", 60,75,61).timeRequiredforCompetition();
         assertEquals("test ", minTime11, -1);
         
         int minTime12 = new CompetitionDijkstra("input-J.txt", 98,70,84).timeRequiredforCompetition();
         assertEquals("test ", minTime12, -1);
         
         
         CompetitionDijkstra newGraph= new CompetitionDijkstra("tinyEWD.txt", 50, 65, 85);
         graph empty=null;
         assertEquals("Testing null graph test1 ", -1.f,newGraph.longestDistD(empty));

         newGraph.graph=null;
         assertEquals("Testing null graph test", -1, newGraph.timeRequiredforCompetition());
         
         CompetitionDijkstra dijkstra = new CompetitionDijkstra("WrongFile", 70,54,50);
         assertEquals("Testing with incorrect File",-1, dijkstra.timeRequiredforCompetition());
 
    }
    @Test
    public void testFWTiming() {	 
    	
    	 int minTime = new CompetitionFloydWarshall(null, 62, 83, 94).timeRequiredforCompetition();
         assertEquals("text on null file", minTime, -1);
         
         int Time = new CompetitionFloydWarshall("tinyEWD.txt", 0, 0, 0).timeRequiredforCompetition();
         assertEquals("text on null file", Time, -1);
         
         
         int minTime1= new CompetitionFloydWarshall("tinyEWD.txt",50,60,70).timeRequiredforCompetition();
         assertEquals("testing graph",minTime1,38);
         
         //times-out on Webcat works on local machine 
        // int minTime2 = new CompetitionFloydWarshall("1000EWD.txt", 62, 83, 94).timeRequiredforCompetition();
        // assertEquals("test on 1000EWD", minTime2, 23);
         
         int minTime3 = new CompetitionFloydWarshall("tinyEWD.txt", 62, 83, 94).timeRequiredforCompetition();
         assertEquals("test on tinyEWD", minTime3, 30);
         
         int minTime4 = new CompetitionFloydWarshall("tinyEWD.txt", 1, 56, 4).timeRequiredforCompetition();
         assertEquals("test too slow", minTime4, -1);
         
         int minTime5 = new CompetitionFloydWarshall("tinyEWD.txt", 109, 200, 64).timeRequiredforCompetition();
         assertEquals("test too fast", minTime5, -1);
         
         int minTime6 = new CompetitionFloydWarshall("tinyEWD.txt", 56, 20, 78).timeRequiredforCompetition();
         assertEquals("test too slow", minTime6, -1);
         
         int minTime7 = new CompetitionFloydWarshall("tinyEWD.txt", 56, 84, 2).timeRequiredforCompetition();
         assertEquals("test too slow", minTime7, -1);
         
         int mintime8 = new CompetitionFloydWarshall("input-C.txt", 62, 83, 94).timeRequiredforCompetition();
         assertEquals("test on input-C", mintime8, -1);
         
         
         int minTime9 = new CompetitionFloydWarshall("tinyEWD.txt", 90, 200, 64).timeRequiredforCompetition();
         assertEquals("test too fast", minTime9, -1);
         
         int minTime10 = new CompetitionFloydWarshall("tinyEWD.txt", 90,66, 200).timeRequiredforCompetition();
         assertEquals("test too fast", minTime10, -1);
         
         int minTime11 = new CompetitionFloydWarshall("input-J.txt", 60,75,61).timeRequiredforCompetition();
         assertEquals("test ", minTime11, -1);
         
         int minTime12 = new CompetitionFloydWarshall("input-J.txt", 98,70,84).timeRequiredforCompetition();
         assertEquals("test ", minTime12, -1);
         
         CompetitionFloydWarshall newGraph= new CompetitionFloydWarshall("tinyEWD.txt", 50, 65, 85);
         graph empty=null;
         assertEquals("Testing null graph test2 ", -1.f,newGraph.longestDist(empty));

         newGraph.graph=null;
         assertEquals("Testing null graph ", -1, newGraph.timeRequiredforCompetition());
         
         
         
         CompetitionFloydWarshall graph5 = new CompetitionFloydWarshall("WrongFile", 70,54,50);
         assertEquals("Testing with incorrect File",-1, graph5.timeRequiredforCompetition());
         
       
 
    }

    //TODO - more tests
    
    @Test
    public void testGraphClass() {
    	graph graph1= new graph(20,15,30,60,70);
    	Edge edge= new Edge(3,0,1);
        float distance=edge.getDistance();
    	int from=edge.getFrom();
    	int to=edge.getTo();
        graph1.insertEdge(edge);
        int e= graph1.getEdges();
        assertEquals("testing get edge",15 ,e);
        int v=graph1.getV();
        assertEquals("testing vertices",20,v);
     
    }
    
}
