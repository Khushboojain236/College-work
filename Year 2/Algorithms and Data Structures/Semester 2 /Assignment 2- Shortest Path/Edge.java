public class Edge {

	float distance;
	int from;
	int to;
	
	Edge(float distance,int from , int to){
		this.distance=distance;
		this.from=from;
		this.to=to;
	}
	Edge(){
		
	}
	
	float getDistance() {
		return this.distance;
	}
	
	int getFrom() {
		return this.from;
	}
	
	int getTo() {
		return this.to;
	}
}
