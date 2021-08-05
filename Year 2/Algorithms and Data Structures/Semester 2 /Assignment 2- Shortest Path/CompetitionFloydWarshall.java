import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/*
 * A Contest to Meet (ACM) is a reality TV contest that sets three contestants at three random
 * city intersections. In order to win, the three contestants need all to meet at any intersection
 * of the city as fast as possible.
 * It should be clear that the contestants may arrive at the intersections at different times, in
 * which case, the first to arrive can wait until the others arrive.
 * From an estimated walking speed for each one of the three contestants, ACM wants to determine the
 * minimum time that a live TV broadcast should last to cover their journey regardless of the contestantsâ€™
 * initial positions and the intersection they finally meet. You are hired to help ACM answer this question.
 * You may assume the following:
 *    ï‚· Each contestant walks at a given estimated speed.
 *    ï‚· The city is a collection of intersections in which some pairs are connected by one-way
 * streets that the contestants can use to traverse the city.
 *
 * This class implements the competition using Floyd-Warshall algorithm
 */


public class CompetitionFloydWarshall {

    /**
     * @param filename: A filename containing the details of the city road network
     * @param sA, sB, sC: speeds for 3 contestants
     */
	
	  graph graph;
	  int sA,sB,sC;
	  
	 
	  
	  float[][] FloydWarshallGraph(graph graphObject){
		float[][] matrixFW=graphObject.graph;
		
		int vertices= graphObject.v;
		float[][] distance=new float[vertices][vertices];
		int v,w,u;

        // initialize distances 
        for ( v = 0; v < vertices; v++) {
            for ( w = 0; w < vertices; w++) {
                distance[v][w] = matrixFW[v][w];
            }
        }

        // overwriting infinity to zero
        for (v = 0; v < vertices; v++) {
            if(distance[v][v]>=0.0) {
            	distance[v][v]=0;
            }
           }
        
        for ( u = 0; u < vertices; u++) {
            for (v = 0; v< vertices; v++) {
                for (w = 0; w < vertices; w++) {
                    if (distance[v][u] + distance[u][w] < distance[v][w]) {
                        distance[v][w] = distance[v][u] + distance[u][w];
                    }
                }
            }
        }
           
		return distance;
		  
	  }
	 
    CompetitionFloydWarshall (String filename, int sA, int sB, int sC){

        //TODO
     if(filename!=null) {
    	 try {
    		 FileReader file = new FileReader(filename);
    		 BufferedReader buffer= new BufferedReader(file);
    		 
    		 int V = Integer.parseInt(buffer.readLine());
    		 int edges= Integer.parseInt(buffer.readLine());
    		 graph= new graph(V,edges,sA,sB,sC);
    		 Edge temp= new Edge();
    		 for (int i=0; i < edges ;i++) {
    			 String line= buffer.readLine();
    			 String[] par = line.trim().split("\\s+");
    			 temp.from= Integer.parseInt(par[0]);
    			 temp.to=Integer.parseInt(par[1]);
    			 temp.distance=Float.parseFloat(par[2]);
    			 graph.insertEdge(temp);
    		 }
    	 }catch (IOException e){
    		 e.printStackTrace();
    	 }
     }
    }
    
  

    /**
     * @return int: minimum minutes that will pass before the three contestants can meet
     */
    public int timeRequiredforCompetition(){

        //TO DO
    	if(graph!=null) {
    		if( graph.sA<50 || graph.sB<50 || graph.sC<50) {
    			return  -1;
    		}
            if(graph.sA>100 || graph.sB>100 || graph.sC>100) {
            	return -1;
            }
            if(graph.getV()==0) {
            	return -1;
            }
            if(graph.getEdges()==0) {
            	return -1;
            }
            int slowestSpeed = slowestSpeed(graph.sA, graph.sB, graph.sC);
            System.out.println(slowestSpeed);
            float longestDistance =longestDist(graph);
            if (longestDistance == -1) {
            	return -1;
            }
            System.out.println(longestDistance);
            return (int) Math.ceil((longestDistance * 1000) / slowestSpeed);
        }else {	
        return -1;
        }
    }

	float longestDist(graph graph) {
		// TODO Auto-generated method stub
		if(graph!=null) {
			float longestDistance=0;
			float[][]dist=FloydWarshallGraph(graph);
			for(int v=0;v <dist.length;v++) {
				for(int w=0;w<dist.length;w++) {
					if(dist[v][w] > longestDistance) {
						longestDistance=dist[v][w];
					}
					if(dist[v][w]==Float.POSITIVE_INFINITY && v!=w) {
						return -1;
					}
				}
			}
			return longestDistance;
		}
		else {
		return -1;
		}
	}

	private int slowestSpeed(int sA2, int sB2, int sC2) {
		// TODO Auto-generated method stub
		
		int slowest=Math.min(sA2, Math.min(sB2, sC2));
		return slowest;
	}
	
}
