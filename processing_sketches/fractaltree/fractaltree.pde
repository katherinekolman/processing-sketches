ArrayList<Branch> tree;
Branch root;
int numLevels = 7;

void setup() {
    frameRate(30);
    size(window.innerWidth, window.innerHeight - 300);

    tree = new ArrayList<Branch>(100);
    root = new Branch(new PVector(width / 2, height), new PVector(width / 2, height - 200), 1);
    tree.add(root);
    growTree();
    for (int i = 0; i < tree.size(); i++) {
        tree.get(i).show();
    }
}

void draw() {
    background(242, 201, 232);
    for (int i = 0; i < tree.size(); i++) {
        tree.get(i).show();
        tree.get(i).wiggle();
        if (!tree.get(i).isGrown()) {
            tree.get(i).growLeaves();
        }
    }
}

void keyPressed() { // starts the tree over
    if (key == ' ') {
        setup();
        draw();
    }
}

void growTree() {
    for (int i = 0; i < numLevels; i++) {
        for (int j = tree.size() - 1; j >= 0; j--) {
            if (!tree.get(j).isGrown()) {
                tree.add(tree.get(j).branch()[0]);
                tree.add(tree.get(j).branch()[1]);
            }
        }
    }
}


class Branch {
    PVector start;
    PVector end;
    PVector origEnd;
    int level;
    boolean grown;
    float offset = 0;

    public Branch(PVector start, PVector end, int level) {
        this.start = start;
        this.origEnd = end;
        this.end = end;
        this.grown = false;
        this.level = level;
    }

    void show() {
        strokeWeight(10 - this.level);
        stroke(255);
        line(this.start.x, this.start.y, this.end.x, this.end.y);
    }

    void growLeaves() {
        noStroke();
        //fill(192, 229, 167); green
        fill(234, 239, 158);
        ellipse(this.end.x, this.end.y, 20, 20);
    }

    boolean isGrown() {
        return this.grown;
    }

    void wiggle() {
    }

    Branch[] branch() {
        Branch[] branches = new Branch[2];

        PVector direction = PVector.sub(this.end, this.start);
        direction.mult(0.67);
        direction.rotate(PI / random(4, 8));
        PVector newEnd = PVector.add(this.end, direction);
        Branch right = new Branch(this.end, newEnd, this.level + 1);
        branches[0] = right;

        direction.rotate(-2 * PI / random(4, 8));
        newEnd = PVector.add(this.end, direction);
        Branch left = new Branch(this.end, newEnd, this.level + 1);
        branches[1] = left;

        this.grown = true;
        return branches;
    }
}
