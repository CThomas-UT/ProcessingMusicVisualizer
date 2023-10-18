
// function for swapping between menus
void menuSwitch(){
    if (main_menu){
      song_select.display(colors);
      color_scheme.display(colors);
      if (song_select.clicked()) {
        selectInput("Select a song:", "songSelected");
      }
      if (color_scheme.clicked()){
        color_index += 1;
        if (color_index > 3){
          color_index = 0; 
        }
        colors = color_pallet[color_index];
      }
    }
    if (main_menu == false){
      play_pause.display(colors);
      menu.display(colors);
      if (play_pause.clicked()) {
        if (song.isPlaying()){
          song.pause(); 
        } else{
          song.loop();
        }
      }
      if (menu.clicked()){
        main_menu = true;
        song.pause();
        
      }
    }
    ScreenHeader();

}
