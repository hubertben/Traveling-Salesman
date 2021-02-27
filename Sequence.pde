

class Sequence{

  public Node[] nodes;
  
  public Sequence(Node[] nodes){
    this.nodes = nodes;
  }
  
  public float solve(){
      float sum = 0;
      int len = this.nodes.length; 
      for(int i = 0; i < len-1; i++){
        sum += this.nodes[i].distance_to(this.nodes[i+1]);
      }
      return sum;
  }
  
  public void print_sequence(){
    
    for(int i = 0; i < this.nodes.length; i++){
      print(nodes[i].name + "\t");
    }
    println();
    
  }
  
  public void display_sequence(){
    strokeWeight(5);
    for(int i = 0; i < this.nodes.length-1; i++){
      nodes[i].edge_to(nodes[i+1]);
      //println(nodes[i].name + "\t" + nodes[i+1].name);
    }
    
    
    if(!open){
      nodes[0].edge_to(nodes[this.nodes.length-1]);
    }
    
    strokeWeight(1);
  }

}
