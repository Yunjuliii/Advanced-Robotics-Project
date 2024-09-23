# Control and Path Planning of Quadrotor

*Advanced Robotics Project in University of Pennsylvania*

## 1. Quadrotor Control Using Cascade PD Controller

In this part of the project, a cascade PD controller was implemented to control the quadrotor to follow a pre-defined trajectory. The control system is designed to regulate both position and orientation of the quadrotor, ensuring it accurately tracks the reference path. Below is the MATLAB simulation result showing the quadrotor’s performance on the given trajectory:

![Quadrotor Trajectory](path_to_your_matlab_image.png)

## 2. Path Planning Algorithms

In the second part of the project, two path planning algorithms were implemented to guide the quadrotor from the start point to the goal through a grid-based environment with obstacles. These algorithms are:

- **Dijkstra Algorithm:** This algorithm finds the shortest path without considering heuristic information, ensuring optimality.
  
  ![Dijkstra Algorithm](path_to_dijkstra_image.png)

- **A* Algorithm:** This algorithm uses a heuristic to improve search efficiency while maintaining optimality.

  ![A* Algorithm](path_to_a_star_image.png)
