class FreqLines{
    int freq_range_min, freq_range_max, freq_range;
    float leftX, vert_offset, multiplier;
    Cloud cloud;
    float x = 0;
    float y = 0;
    float destX = x;
    float destY = y;
    

    FreqLines(float leftX, int freq_range_min, int freq_range_max, float multiplier){
        this.leftX = leftX;
        this.freq_range_min = freq_range_min;
        this.freq_range_max = freq_range_max;
        this.multiplier = multiplier;
        this.freq_range = freq_range_max - freq_range_min;
        cloud = new Cloud();

    }

    void display(float[] sum, float vert_offset, float bottom_line, float freq_line_min, float freq_line_max){
        for (int ln = this.freq_range_min; ln <= this.freq_range_max; ln++){
               // have random length for the lines
               float freq_line_len = map(noise(ln * 0.2), 0, 1, freq_line_min, freq_line_max);

               if (sum[0] != 0) {
                   freq_line_len = map(sum[round(ln)], 0, 40, freq_line_len - freq_line_len / 8, freq_line_max * this.multiplier);
               }

               x = 2 * (ln - freq_range_min) + leftX;
               y = vert_offset;
               destX = x;
               destY = y;

               for (int i = 0; i <= freq_line_len; i++) {
                   int y2 = round(vert_offset) + i;

                   if (y2 <= bottom_line) {
                       destY = y2;
                   }
               }

               stroke(colors[0]);


               if (y <= bottom_line)  {
                   line(x, y, destX, destY);
               }
           }
        
        cloud.display(this.freq_range, this.leftX + this.freq_range, vert_offset, colors[2]);        
    }

}
