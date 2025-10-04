# first-game

I followed this written tutorial: https://docs.godotengine.org/en/stable/getting_started/first_2d_game/06.heads_up_display.html

I changed some of the HUD, removed some of the text from the tutorial and added an hp counter in the top right

I also added invicibility frames and changed the character to red during those frames. Including a sound effect on hit.
I changed the music to First of the Year by skrillex. It was just a joke while I had my roommate playing it, but I thought it was funny and made me motivated to get to a certain part of the song. so I feel that it added a lot to the game.

I only committed one time, so there won't be commits for every single feature I added, and on top of that I added my features as I was going through the tutorials

I used ChatGPT to help me add some of my features, however I did not just copy straight code, I had it walk me through the steps and if I got snagged on something it would help me fix certain errors. 

The main game probably took me around 3-4 hours. Since I was trying to add a lot of my features as I was going through the tutorial, I ended up getting alot of errors especially with signals not going where they should be. Adding the hp functionality took me about an hour, maybe another 15-20 minutes for the hp on the hud. the on hit sound was really quick maybe 5 minutes, and the background music was like a 2 second change. Tt took me longer to download it than implement the change. Getting the timer to feel good on the invicibility after hit took me about 30-45 minutes, just because I was changing it as I was working on other stuff to get a feel for it. Overall it probably took me about 5 or 6 hours to complete my first game. I'm proud of it and didn't think itd be as much fun as it was.


---- ASSIGNMENT 2 ADDITIONS ----
For The second assignment I added 3 loops:
These include the hp loop, the achievement loop and the difficulty loop.
In the HP loop, the player dodges enemies and every 50 seconds gains an hp back. 
In the achievement loop, every thirty seconds a sound plays and the level increments. 
Within the difficulty loop, every time the level increments, the spawn rate increases and the velocity range increases, making the levels more difficult as you go.


---- ADDING JUICE ----

1st addition: Changed background to dungeon. Took about 15 minutes, getting the background image took the longest

2nd addition: Changed player and mob animation to be slimes. Blue slimes are good, others are evil. creating the animations took me about an hour, it took me a long time to decide on what sort of mob/character I wanted to add to the game

3rd addition: Added blood particle effects on hit. This took me about 30 minutes, I didn't know how to scale the particle effect properly and at first every time on hit, the particle was huge and had gravity and would spawn like 20 blood particles

4th addition: Added camera shake on hit. This took me about 30 minutes. I wasn't sure how to add the camera shake, I first had to had a camera2D node and then add the camera shake on top of that.

5th addition: Changed "levels" to waves and adjusted UI to have same baseline. this was a quick fix just a UI change. It took me about 15 minutes to move all the UI around and get it to have the margins that I wanted. 

6th addition: Added a game over sound effect and fixed the timers persisting after game ends. This took me about 30 minutes, I wasn't sure exactly why the timers would continue after the game would end. It was a simple fix though and I ended up just having to do $timer.stop() for each of the timers, I felt dumb after figuring this one out.

