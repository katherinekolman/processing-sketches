ArrayList<Branch> tree = new ArrayList<Branch>(100);
Branch root;

void setup() {
    size(500, 500);
    
    root = new Branch(new PVector(width / 2, height), new PVector(width / 2, height - 100));
    tree.add(root);
}

void draw() {
    background(51);
    for (int i = 0; i < tree.size(); i++)  {
         tree.get(i).show();   
    }
}

void mousePressed() {
    for (int i = tree.size() - 1; i >= 0; i--) {
        if (!tree.get(i).isGrown()) {
            tree.add(tree.get(i).branch()[0]);
            tree.add(tree.get(i).branch()[1]);
        }
    }
}


class Branch {
    PVector start;
    PVector end;
    boolean grown;
   
    public Branch(PVector start, PVector end) {
        this.start = start;
        this.end = end;
        this.grown = false;
    }
    
    void show() {
        stroke(255);
        line(this.start.x, this.start.y, this.end.x, this.end.y);     
    }
    
    boolean isGrown() {
        return this.grown;
    }
    
    Branch[] branch() {
        Branch[] branches = new Branch[2];
        
        PVector direction = PVector.sub(this.end, this.start);
        direction.mult(0.67);
        direction.rotate(PI / 6);
        PVector newEnd = PVector.add(this.end, direction);
        Branch right = new Branch(this.end, newEnd);
        branches[0] = right;
        
        direction.rotate(-2 * PI / 6);
        newEnd = PVector.add(this.end, direction);
        Branch left = new Branch(this.end, newEnd);
        branches[1] = left;
        
        this.grown = true;
        return branches;
    }
}
