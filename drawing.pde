// Globals for drawing 


// mountain parameters
color strke = colors[3];
color fl = colors[0];
int adder = 15;
Mountains m = new Mountains(adder);

// bass parameters
FreqLines bass = new FreqLines(60, 0, 50, 0.75);

// high parameters (being weird, setting the left x is requiring massive additions to the width of the window
FreqLines high = new FreqLines(width + 1050, 190, 240, 4);


// sets radius of the sun and the offset from the bottom line
int vert_offset, sun_radius;


void AllDraw(float[] sum, float lvl){

    // Middle Sun sets size to 15% of height, get offset 
    sun_radius = 15 * round(unit * lvl);
    sun_radius = constrain(sun_radius, round(unit) * 15, round(unit) * 16);
    vert_offset = round(sin(radians(150)) * sun_radius);

    // initialize x and y
    float x = 0;
    float y = 0;
    
    // shortest and longest line lengths of visualization
    float freq_line_min = sun_radius * 1.15;
    float freq_line_max = sun_radius * 3.45; 

    float destX;
    float destY;
    
    // bass lines
    bass.display(sum, vert_offset, bottom_line, freq_line_min, freq_line_max);


    // high freq
    high.display(sum, vert_offset, bottom_line, freq_line_min, freq_line_max);
    

    // all freq around sun
    // code based on https://www.generativehut.com/post/using-processing-for-music-visualization
    for (int angle = 0; angle <= 240; angle++) {
        // if there's nothing in the frequency, add some noise to it to make there be something there
        float freq_line_rad = map(noise(angle * 0.3), 0, 1, freq_line_min, freq_line_max);

        //
        if (sum[0] != 0) {
            freq_line_rad = map(sum[round(angle)], 0, 40, freq_line_rad - freq_line_rad / 8, freq_line_max * 4);
        }
    
        x = round(cos(radians(angle + 150)) * sun_radius + center_point.x);
        y = round(sin(radians(angle + 150)) * sun_radius + bottom_line - vert_offset);
        destX = x;
        destY = y;

        for (int i = sun_radius; i <= freq_line_rad; i++) {
            int x2 = round(cos(radians(angle + 150)) * i + center_point.x);
            int y2 = round(sin(radians(angle + 150)) * i + bottom_line - vert_offset);

            if (y2 <= bottom_line) {
                destX = x2;
                destY = y2;
            }
        }

        stroke(colors[1]);
  
    
        if (y <= bottom_line)  {
            line(x, y, destX, destY);
        }
    }

    // draw sun
    ellipseMode(RADIUS);
    fill(colors[1]);
    ellipse(center_point.x, center_point.y - vert_offset, sun_radius, sun_radius);

    // Ground mountains
    m.display(colors[2], colors[0]);

}
