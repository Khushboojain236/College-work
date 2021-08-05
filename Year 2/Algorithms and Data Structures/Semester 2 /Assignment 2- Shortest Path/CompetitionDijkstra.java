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
 * This class implements the competition using Dijkstra's algorithm
 */

public class CompetitionDijkstra {

    /**
     * @param filename: A filename containing the details of the city road network
     * @param sA, sB, sC: speeds for 3 contestants
    */
	
	int sA, sB , sC;
	graph graph;
	
	 float[] dijkstra(graph graphObject, int start) {
		// TODO Auto-generated method stub
		int vertices=graph.v;
		float[][] matrixD =graphObject.graph;
		
		float distances[]= new float[vertices];
		Boolean visited[]= new Boolean[vertices]; 
		
		for(int u=0; u< vertices; u++) {
			distances[u]=Float.POSITIVE_INFINITY;
			visited[u]=false;
		}
		distances[start]=0;
		
		for(int i=0;i< vertices-1;i++) {
			int temp=shortestDistance(distances,visited,vertices);
			
			
			if(temp!= -1) {
				visited[temp]= true;
				for(int j=0; j<vertices ;j++) {
					if(!visited[j] && matrixD[temp][j]!= Float.POSITIVE_INFINITY && 
							distances[temp]!=Float.POSITIVE_INFINITY && distances[temp] + matrixD[temp][j] < distances[j]) {
						 distances[j] = distances[temp] + matrixD[temp][j];
					}
				}
					
			}
		}
		return distances;
	}
	
	
     int shortestDistance(float[] distances, Boolean[] visited, int vertices) {
		// TODO Auto-generated method stub
    	 float minimum= Integer.MAX_VALUE;
    	 int minimumIndex= -1;
    	 
    	 for(int w=0;w<vertices; w++) {
    		 if(visited[w]==false && distances[w]<=minimum) {
    			 minimum=distances[w];
    			 minimumIndex=w;
    		 }
    	 }
		return minimumIndex;
	}


	CompetitionDijkstra (String filename, int sA, int sB, int sC){
       //TODO
    	int V=0;
    	 if(filename!=null) {
        	 try {
        		 FileReader file = new FileReader(filename);
        		 BufferedReader buffer= new BufferedReader(file);
        		 
        		 V = Integer.parseInt(buffer.readLine());
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
            int slowestSpeed = slowestSpeedD(graph.sA, graph.sB, graph.sC);
            System.out.println(slowestSpeed);
            float longestDistance =longestDistD(graph);
            if (longestDistance == -1) {
            	return -1;
            }
            System.out.println(longestDistance);
            return (int) Math.ceil((longestDistance * 1000) / slowestSpeed);
        }else {	
        return -1;
        }
    }


	float longestDistD(graph graph) {
		// TODO Auto-generated method stub
		if(graph!=null) {
			float longestDist=0;
			float[] dists;
			for(int i=0;i<graph.v;i++) {
				dists=dijkstra(graph,i);
				for(int v=0;v<dists.length;v++) {
					if(dists[v]>longestDist) {
						longestDist=dists[v];
					}
					if(dists[v]==Float.POSITIVE_INFINITY && i!=v) {
						return -1;
					}
				}
			}
			return longestDist;
		}
		else{
			return -1;
		}
	}


	private int slowestSpeedD(int sA2, int sB2, int sC2) {
		// TODO Auto-generated method stub
		int slowest=Math.min(sA2, Math.min(sB2, sC2));
		return slowest;
	}

}