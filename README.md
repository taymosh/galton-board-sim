# Intro

In this project I tried to recreate what many know as plinko.

https://github.com/user-attachments/assets/030fcf15-e6fe-4ac5-9095-7fd20d1b1323

# Behind the scenes
### Peg Layout Generator
I have made a script that generates a peg layout from 3 properties: Peg Count, Peg Radius, Peg Gap

<img width="284" height="173" alt="kép" src="https://github.com/user-attachments/assets/3f9063ef-88cd-447b-ae8d-101be73ec923" />

How the tree and scene looks:

<img width="1633" height="639" alt="kép" src="https://github.com/user-attachments/assets/bee64d3f-a783-4a13-adad-37c989247d81" />

### Peg
This class extending StaticBody3D handles animating itself whenever a Ball touches it.

### Ball Spawner
This script has the logic for spawning a ball whenever Space is held.

### Ball
This script has the logic for the movement of the ball, drawing the line, and spawning ghosts.

# Performance
If I were to start again with the knowledge I achieved while working on it, i would focus more on optimising the rendering by using MultiMeshInstance2D instead of a new Sprite2D everytime the balls collide.

Though surprisingly the sprites barely have an impact on performance, it's actually the Line2D that's affecting it.
It is still running just fine, and let's be honest there isn't a reason to spawn as many balls as it takes to start to tank the performance.

<img width="1348" height="291" alt="kép" src="https://github.com/user-attachments/assets/436135ee-0fa8-434a-be26-5b5fbc82cad4" />

This is how the scene must have looked at the selected frame:

<img width="1104" height="621" alt="kép" src="https://github.com/user-attachments/assets/1578a494-51ac-40e4-a5c5-16a39da5ac62" />
