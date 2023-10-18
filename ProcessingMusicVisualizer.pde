

// Go to Sketch, Import library, manage library, search minim in filter bar, 
// Then click on Minim library (2.2.2) and press install on the bottom right hand side



// Import minim library
import ddf.minim.*;
import ddf.minim.analysis.*;


// globals

// Colors
color[][] color_pallet = {
    {#000000, #303030, #808080, #FFFFFF},
    {#303030, #38B4C8, #EE8EE5, #FFFFFF},
    {#510000, #740000, #9f3434, #ffa5a5},
    {#1666ba, #368ce7, 	#7ab3ef, #deecfb}
    };
    
int color_index;
color[] colors = color_pallet[0];




// Music analysis
AudioPlayer song;
FFT fft;
Minim minim;  

// Animation
float unit;
float bottom_line;
PVector center_point;

// file, fft analysis vars
String audio_file = "DrinkWater-JonBatiste.mp3";
float smoothing_factor = 0.25;
int bands = 280;

float[] spectrum = new float[bands];
float[] sum = new float[bands];

// check if on main menu or not
boolean main_menu = true;

// Main Menu Buttons
Button song_select, color_scheme;

// Visualizer buttons
Button play_pause, menu;




void setup() {
    font = createFont("PLANK___.TTF",128);
    size(1300, 800);
    frameRate(30);
    // for antialiasing 
    smooth(8);
    // Animation settings
    //--------------------------------//
    // unit value to reference everything by (1% of height)
    unit = height / 100;
    // set line width based on unit value (10% of unit)
    strokeWeight(unit * 0.1);
    // set the bottom line 80% of the way down and center point for the sun to be that far down at the middle
    bottom_line = height * 0.80;
    center_point = new PVector(width / 2, bottom_line);
    //----------------------------------//
    // Audio/Analysis settings
    //--------------------------------//
    // create minim instance and load song (and then loop it after a few seconds of cueing)
    minim = new Minim(this);
    song = minim.loadFile(audio_file, 2048);
    //song.loop();
    // setup new fft analysis
    // fft gets info on how long to digest audio sample(buffer size), and sample rate is fps for sound
    fft = new FFT(song.bufferSize(), song.sampleRate());
    // Sets up how many frequency bands are wanted
    fft.linAverages(bands);
    //--------------------------------// 
    
    // color setup
    color_index = 0;
    colors = color_pallet[color_index];
    
    // button setup (main menu)
    song_select = new Button("Song Select", 15, height/2, 200, 100);
    color_scheme = new Button("Color Change", width - 215, height/2, 200, 100);
    
    // button setup (visualizer)
    play_pause = new Button("Play/Pause", width - 215, height/2 - 25, 200, 50);
    menu = new Button("Menu", width - 215, height/2 + 25, 200, 50);
}

void songSelected(File selected){
  song = minim.loadFile(selected.getAbsolutePath(), 2048);
  audio_file = song.getMetaData().title();
  loop();
  main_menu = false;
}


// add in pausing feature at keypress
void keyPressed(){

  if (keyCode == SHIFT){
    main_menu = true;
    song.pause();
  }
  if (main_menu == false){
    if (key == 'p'){
      if (song.isPlaying()){
        song.pause();
      } else {
        song.loop();
      }      
    }
  } else {
    if (key == 'c'){
      color_index += 1;
      if (color_index > 3){
        color_index = 0;
      }
      colors = color_pallet[color_index];
    }    
  }

}

void mouseReleased(){
  loop();
}


void draw() {
    fft.forward(song.mix);
 
    spectrum = new float[bands];
 
    for(int i = 0; i < fft.avgSize(); i++){
        spectrum[i] = fft.getAvg(i) / 2;
 
        // Smooth the FFT spectrum data by smoothing factor
        sum[i] += (abs(spectrum[i]) - sum[i]) * smoothing_factor;
    }

 
    // Reset canvas
    background(colors[3]);
 
    AllDraw(sum, fft.getAvg(3));
    menuSwitch();
}
