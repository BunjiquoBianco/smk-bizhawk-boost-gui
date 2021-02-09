# smk-bizhawk-boost-gui
Lua script for adding some extra overlay information for Super Mario Kart emulated in BizHawk/BSNES

Currently, only works with Bowser/DK due to the way the speedometer needs to work. However, as this is designed to train 
me to recognise when I can release a boost in Time Trials, this is probably how it will stay.
I imagine this script would have extremely limited use in other game modes.

## Speed-o-meter
Gives an indication of player 1's speed as the word LOW/MED/MAX/BOOST written out to the top left of the screen.
Due to the way speed works in SMK Bowser/DK top speed fluctuates between 1100 and 1105. So, for example, when your speed 
is between these values "MAX" is displayed. Anything over 1105 is marked as "BOOST".

## Boost-o-meter
Writes the game's internal boost counter (7e10ca) to the screen in the top left. Once this goes above 128 the font size 
grows dramatically as an obvious indication it can be released. 
