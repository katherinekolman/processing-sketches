Star[] stars = new Star[500];

void setup() {
    size(window.innerWidth, 700);
    background(0);
    
    fill(255);
    for (int i = 0; i < 500; i++) {
        stars[i] = new Star(random(width), random(height));
    }
}

void draw() {
    noStroke();
    background(0);
    fill(253, 253, 253);
    for (int i = 0; i < stars.length; i++) {
        fill(253, 253, 253, stars[i].changeAlpha());
        stars[i].display();
    }
}

void keyPressed() {
    if (key == 'r') {
        for (int i = 0; i < 500; i++) {
             stars[i] = new Star(random(width), random(height));   
        }
    }
}

class Star {
    float x;
    float y;
    float alpha;
    float counter;

    public Star(float x, float y) {
        this.x = x;
        this.y = y;
        this.alpha = 255;
        this.counter = random(0, 10);
    }

    public float changeAlpha() {
        alpha = alpha * sin(counter);
        alpha = map(alpha, -255, 255, 0, 255);
        counter += 0.075;
        return alpha;
    }

    public void display() {
        ellipse(x, y, 3, 3);
    }
}
