# Processing Music Visualizer
*A Music Visualizer in the Java Library Processing*


## Functionality 

Once you run the file you'll be faced with the main menu screen, below is the functionality on that screen  
  
**Select Song Button:**  
This button once pressed will open a file browser and allow you to select an .mp3 file
&nbsp;&nbsp;&nbsp;&nbsp;*Note: there is no safeguard against opening a different file type, thus the user must be cautious and only select .mp3*
After completion, the main menu will be exited and the music visualizer screen will be opened and available  

**Change Color Button:**  
This button once pressed will cycle through 4 separate colorways  

**Pressing character 'c':**  
This operates the same way as the change color button mentioned above  
   
Once the song file is selected, the screen will be changed to the music visualizer screen, below is the functionality on that screen  
&nbsp;&nbsp;&nbsp;&nbsp;*Note: Please click on the window after selecting a song to make sure processing recognizes you're back viewing the window*

**Play/Pause button:**  
This button once pressed will start a stopped song or will stop a song that is playing  

**Pressing character 'p':**  
This operates the same way as the Play/Pause button mentioned above  

**Menu button:**  
This button once pressed will return you to the main menu where you will be able to access the functionality mentioned in the first selection  

**Pressing the Shift key:**  
This operates the same way as the menu button mentioned above  


## About Overall Project

#### functionality and implementation

**Song Selection:**
using selectInput, I was able to have a popup where users could select the mp3 file which they want for visualization. This was then used in tandem with a button from the button class to have the user be able to choose when they want to select a song rather than one being selected upon opening the project. This then triggers the flipping of a boolean to switch screens

**Menus:**
The main menu also uses the buttons, but it adds in the use of the screen check file which sets the font and then also chooses what text to display on top (whether just the title of the program or the title of the song). Positioning was just based on width of the window, and the two menus swap via checking if statements on whether or not it's the main menu. The visualizer menu adds in rotation of the heading text for more pizzazz

**Buttons:**
These check the mouse x and y positions and then see if its within the borders of the box before checking if the mouse is clicked as well. Then if it is, the clicked function returns true which enables button functionality. The starting and stopping and such was mostly just using MINIM to do so with the different methods provided there. 

**Colors:**
This is a 2D array that's made with 4 different arrays of color values, each pallet having 4 colors in its array. Then the global colors variable is set to the various different indexes (0-3) and that updates and allows the overall colors to change.

**Beat Visualization:**
The FFT analysis code was really tough to understand at first, but I found Estlin's music visualization repo and breakdown at https://www.generativehut.com/post/using-processing-for-music-visualization. Estlin's base use of the center circle was what I was looking for in making a sun with rays of the beat visualization, so the code for the center sun and some of the other functionality like limiting the line length to not go below a certain baseline was also what inspired my implementation of the beat visualization. The trig was also hard so I'm grateful he had worked it out. 

**Shapes:**
They were mostly just ellipses and triangles, where on the triangles I used a for loop with an if statement to change the height of every other mountain.

#### classes

**Button:**
Creates the buttons in the given location with given size and then makes them in a specific color with specified text. These buttons also have functionality as mentioned above to be able to check when they're clicked which passes true then, and then when clicked the colors of the fill and the text flip.

**Cloud:**
The clouds make the clouds that are seen to the left and right of the title. They take in coordinates, size, and color when displayed which then draws their shape with those parameters.

**FreqLines:**
FreqLines creates the frequency lines at a given location, within a specific frequency range, and with a specific multiplier to the frequencies amplitudes. At this location, a cloud is then placed on top to make it look like the beat lines are rain coming from the clouds. They then display the beat lines, based on the range provided earlier.

**Mountains:**
Mountains makes the mountains at the bottom of the screen based on the positioning of the sun. It displayes them in varying heights across the bottom.

#### challenges

There were plenty, my ambitious ideas seemed to crash down quite significantly. The high level overview I definitely achieved, it does have a circle like in the trap nation visualizer. The keyboard interactivity was also achieved, but dealing with a two d array was a little annoying at first to get used to. Also when I went to make the interactivity, I slightly broke how the array was initialized which took some debugging. The Main Menu gui I had to dumb down a lot, no blur, no drop down list, and no option for the volume. I was able to get the user to still choose the song in a different fairly interactive way, which had some weird errors at first but eventually worked smoothly. In visualizer I dropped pretty much all of it. I didn't know how to cycle through the songs in the folder and I didn't add a mute button since that felt redundant with a play and a pause button. I instead combined those buttons into one and then added in a way to get back to the main menu. The rays of the sun do scale to the radius of the sun, as do the mountains and the clouds and rain, where then when the sun changes sizes with the beat, so does the rest. I flipped the rain hierarchy where the clouds are dependent on where the frequencies are located, but this seems a little more complex than just boxes. The file input remained the same as in the ideas where it's just the .mp3 data!