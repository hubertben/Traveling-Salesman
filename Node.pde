int radius = 10 * scale;
 
class Node{

  public int x;
  public int y;
  public String name;
  public color clr;
  
  public Node(int x, int y, String name){
    this.x = x;
    this.y = y;
    this.name = name;
    this.clr = color(255, 255, 255);
  }
  
  public void print_node_info(){
    println("Node:" + this.name + "\tX:" + this.x + "\tY:" + this.y);
  }
  
  public void display(){
    fill(clr);
    this.x += vel_X;
    this.y += vel_Y;
    set_bounds();
    ellipse(this.x, this.y, radius, radius);
    fill(0, 0 ,0);
    text(this.name, this.x, this.y);
    
  }
  
  public void print_distances(){
    println("............" + this.name + "............");
    for(Node n : nodes){
      if(n != this){   
        println(n.name + '\t' + distance_to(n));    
      }
    } 
  }
  
  public float distance_to(Node n){
    return sqrt(((this.x - n.x)*(this.x - n.x)) + ((this.y - n.y)*(this.y - n.y)));
  }
  
  public void edge_to(Node n){
    line(this.x, this.y, n.x, n.y);
  }
  
  public Node get_bounds(float x, float y){
   
    if(sqrt((this.x-x)*(this.x-x)+(this.y-y)*(this.y-y)) <= radius){ 
      return this;
    }
    this.clr = color(255, 255, 255);
    return null;
  }
  
  // Special Features
  
  
  public int vel_X = 0, vel_Y = 0;
  
  public void move_H(){
    if(random(2) <= 1){
      this.vel_X = -1;
    }else{
      this.vel_X = 1;
    }
  }
  
  public void move_V(){
    if(random(2) <= 1){
      this.vel_Y = -1;
    }else{
      this.vel_Y = 1;
    }
  }
  
  public void move_M(){
    this.vel_X = 0;
    this.vel_Y = 0;
  }
  
  public void set_bounds(){
    ellipseMode(CORNER);
    if(this.x-radius < 0 || this.x + radius > width){
      this.vel_X *= -1;
    }
    
    if(this.y-radius < 0 || this.y + radius > height){
      this.vel_Y *= -1;
    }
    ellipseMode(RADIUS);
  }

}
