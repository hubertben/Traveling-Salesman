Node current_grab = null;

void mousePressed(){
  for(Node n : nodes){
    if(n.get_bounds(mouseX,mouseY) != null){
      current_grab = n.get_bounds(mouseX,mouseY);
      current_grab.clr = color(255, 50, 50);
      break;
    }else{
      current_grab = null;
    }
  }
}

void mouseDragged(){
  
  if(current_grab != null){
    current_grab.x = mouseX;
    current_grab.y = mouseY;
    current_grab.display();
    
  }
  
  
  
}

void mouseReleased() {
  if(current_grab != null){
    current_grab.clr = color(255, 255, 255);
  }
  current_grab = null;
}



// Keyboard Handler Included in here

public void keyPressed(){
  
  if(key == '\n'){
    run_once = true;
    bg_color = color(255, 175, 175);
    background(bg_color);
    
    for(Node n : nodes){
      n.display();
    }
    
    textSize(86);
    text("COMPUTING NEW SOLUTION", width/2, height/2);
    textSize(26);
  

  }else if(key == 'a' || key == 'A'){
    node_name_index ++;
    nodes.add(new Node(int(random(50, width)), int(random(50, height)), str(node_name_index)));
    
  
  }else if(key == 'r' || key == 'R'){
    node_name_index --;
    nodes.remove(nodes.size()-1);
  

  }else if(key == 'v' || key == 'V' || key == 'h' || key == 'H'){  
    if(nodes.size() < 9){  
      for(Node n : nodes){     
        switch(key){
        
          case 'v':
            n.move_V();
            break;
          case 'h':
            n.move_H();
            break;    
        }    
      }    
    } 
    
    
  }else if(key == 'm' || key == 'M'){
    for(Node n : nodes){
      n.move_M();
    }
  }else if(key == 'o' || key == 'O'){
  }
  
  

}
