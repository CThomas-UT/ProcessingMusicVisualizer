class Cloud{
    float rad, x, y;
    color c;

    Cloud(){
        
    }

    void display(float rad, float x, float y, color c){
        fill(c);
        noStroke();
        ellipse(x, y, rad * 1.5, rad * 0.5);
        ellipse(x + rad/2, y - rad/3, rad, rad * 0.5);
        ellipse(x - rad/2, y - rad / 4, rad * 0.5, rad * 0.5);
    }
}
