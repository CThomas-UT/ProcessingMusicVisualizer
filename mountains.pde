class Mountains{
    int bottomX, adder;
    color fl, strke;
    boolean check = true;

    Mountains(int adder){
        this.adder = adder;
    }

    void display(color fl, color strke){
        for (int bottomX = 0; bottomX <= width; bottomX += 100) {

            stroke(strke);
            fill(fl);
            if (check){
              check = false;
              triangle(bottomX - 200, height + adder, bottomX + 200, height + adder, bottomX, center_point.y - vert_offset * 0.8 - adder);
            } else{
              check = true;
              triangle(bottomX - 200, height, bottomX + 200, height, bottomX, center_point.y - vert_offset * 0.8 + adder);
            }
            noFill();
        }
    }
}
