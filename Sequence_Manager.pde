
int starting_node = 0;

class Sequence_Manager{

  public Sequence_Manager(){}
  
  public Sequence solve(){
    Sequence shortest_sequence = new Sequence(null);
    float shortest_sequence_sum = 3.30282347 * pow(10, 38);
    Permutation_Generator pg = new Permutation_Generator(nodes.size(), 1);
    
    while (pg.hasMore()) {
      int[] temp =  pg.getNext();
      
      if(temp[0]-1 == starting_node){
      
        int le = nodes.size()+1;
        if(open){
          le = nodes.size();
        }
        
        Node[] input = new Node[le];
        
        for (int i = 0; i < temp.length; i++) {
            input[i] = nodes.get(temp[i]-1);
        }
        
        if(!open){
          input[temp.length] = nodes.get(temp[0]-1);
        }
        
        Sequence s = new Sequence(input);
        float sum = s.solve();
        
        if(sum < shortest_sequence_sum){
          shortest_sequence_sum = sum;
          shortest_sequence = s;
        }
      }
    }
    return shortest_sequence;
  }
  
  public int factorial(int num){
    return num == 1 ? num * factorial(num - 1):1;
  }

}
