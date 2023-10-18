// check which screen it's on
float start_rotation = PI * 1.85;
float end_rotation = PI * 2.15;
float time = 0;
float rotation;
float font_size = 80;

PFont font;

void ScreenHeader(){
    fill(colors[2]);
    textFont(font);
    textSize(font_size);
    textAlign(CENTER);
    if (main_menu){
        text("Music Visualizer", width/2, height/8);
    } else {
        float counter = .5 * (sin(time) + 1);
        pushMatrix();
        rotation = lerp(start_rotation, end_rotation, counter);
        translate(width/2, height/8);
        if (song.isPlaying()){
          rotate(rotation);
        }
        
        text(audio_file, 0, 0);
        popMatrix();
        time += 0.02;
    }
}
