ArrayList<Node> nodes;
int scale = 3;
boolean run_once = false;

boolean open = true;

int node_name_index = 0;

void setup() {
  
  ellipseMode(RADIUS);
  textAlign(CENTER);
  textSize(26);

  String[] lines = loadStrings("test.txt");
  String[] params = split(lines[0], ' ');
  int node_number = int(params[0]);
  int w = int(params[1]) * scale;
  int h = int(params[2]) * scale;
  
  size(200, 200);
  surface.setSize(w + 100, h + 100);
  
  nodes = new ArrayList<Node>();

  for (int i = 1; i < node_number+1; i++) {
    params = split(lines[i], ' '); 
    String name = params[0].toString();
    node_name_index = int(params[0]);
    int x = int(params[1]) * scale;
    int y = int(params[2]) * scale;
      
    println("Loading Node: " + name + "\t at X: " + x + "\tY: " + y); 
    nodes.add(new Node(x, y, name));
  }
}

Sequence s_ = null;
color bg_color = color(200, 200, 200);

void draw() {
  background(bg_color);
  
  print_header();

  if(run_once){
    Sequence_Manager s = new Sequence_Manager();
    s_ = s.solve();
    
  }else{
    bg_color = color(200, 200, 200);
  }
  
  if(s_ != null){
    s_.display_sequence();
  }
  
  for(Node n : nodes){
    n.display();
  }
  
  for(Node n : nodes){
    if(int(n.name) == starting_node){
      n.clr = color(100, 255, 100);
    }else{
      n.clr = color(255, 255, 255);
    }
  }
  
  run_once = false;
}


public void print_header(){
  textAlign(LEFT);
  text("Press Enter to Compute Solution", 15, 30);
  text("Press A to Add Another Node", 15, 60);
  text("Press R to Remove a Node", 15, 90);
  
  String ident = "_";
  if(open){
    ident = "X";
  }
  
  text("[" + ident + "] Press O to Toggle Open Path {[X]:Open}", 15, 120);
  
  text("The Following are Valid when Checked", 15, 180);
  
  ident = "_";
  if(nodes.size() < 9){
    run_once = true;
    ident = "X";

  }
  
  text("[X] Press M to Stop ALL Movement", 15, 210);
  text("[" + ident + "] Press H to Move Nodes Horizontally", 15, 240);
  text("[" + ident + "] Press V to Move Nodes Vertically", 15, 270);
  
  
  textAlign(CENTER);
}
