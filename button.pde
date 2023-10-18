class Button{
    float x, y, wide, high;
    String name;

    Button(String name, float x, float y, float wide, float high){
        this.name = name;
        this.x = x;
        this.y = y;
        this.wide = wide;
        this.high = high;

    }

    boolean hovering(){
        boolean x_vals = this.x < mouseX & mouseX < (this.x + this.wide);
        boolean y_vals = this.y < mouseY & mouseY < (this.y + this.high);
        
        return (x_vals & y_vals);
    }

    boolean clicked(){
      if (this.hovering() & mousePressed){
        noLoop();
        return true;
      } return false;
    }      

    void display(color[] colors){
        fill(colors[0]);
        stroke(colors[3]);
        rectMode(CORNER);
        rect(this.x, this.y, this.wide, this.high);
        fill(colors[3]);
        textAlign(CENTER);
        textSize(20);
        text(this.name, this.x + this.wide/2, this.y + this.high/2);

        if (this.clicked()){
            fill(colors[3]);
            stroke(colors[0]);
            rectMode(CORNER);
            rect(this.x, this.y, this.wide, this.high);
            fill(colors[0]);
            textAlign(CENTER);
            textSize(20);
            text(this.name, this.x + this.wide/2, this.y + this.high/2);
        }

    }
}
