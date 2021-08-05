public class graph {

	int v;//vertices
	int sA,sB,sC;
	int edges;
	float[][] graph;
	
	public graph(int v,int edges,int sA,int sB,int sC) {
		graph=new float[v][v];
		for(int i=0; i<v; i++){
            for(int j=0; j<v; j++){
                graph[i][j]=Float.POSITIVE_INFINITY;
            }
        }
		this.v=v;
		this.edges=edges;
		this.sA=sA;
		this.sB=sB;
		this.sC=sC;
	}
	
	int getV() {
		return v;
	}
	
	int getEdges() {
		return edges;
	}
	
	void insertEdge(Edge newE) {
		graph[newE.from][newE.to]=newE.distance;
	}
}
