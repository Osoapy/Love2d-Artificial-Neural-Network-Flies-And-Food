# Love2D Neural Network - Flies and Food
A simple simulation to learn genetic algorithms using neural networks. In this project, flies will learn how to find the best path to food using evolutionary techniques. Each generation is based on the most successful fly from the previous one.

<div align="center">
  <img src="https://i.pinimg.com/originals/f5/31/a2/f531a27da099b63bb3aaf9f21e477d88.gif"/>
</div>

## Overview
This project focuses on simulating a genetic algorithm where neural network-controlled flies attempt to reach a food source. The best-performing fly will influence the traits of the next generation, aiming for more optimized behavior over time.

---

## Main
### Responsibilities:
- **Rendering**: Draw all elements (background, flies, food).
- **Simulation Logic**: Check if all flies are dead, and reset if necessary.
- **Mutation**: Apply mutation to the next generation based on the best-performing fly.

---

## Population
### Parameters:
- **Number of flies**: The total count of flies in the simulation.
- **Maximum steps**: The number of steps each fly is allowed to take.
- **Maximum speed**: The highest speed a fly can achieve.
- **Food coordinates**: Location of the food on the screen.
- **Mutation rate**: The probability of mutations occurring in the next generation.

### Internal Attributes:
- **General fitness**: The combined fitness of all flies.
- **Generation count**: Number of generations passed.
- **Best fly index**: Index of the best-performing fly in the current generation.
- **All flies**: A collection containing every fly object.

### Functions:
- **show**: Render all flies.
- **create**: Initialize the population of flies.
- **update**: Update the state of each fly (movement, status).
- **calculateFitness**: Measure the performance of each fly based on how close they got to the food.
- **areAllFliesDead**: Determine if all flies have completed their attempts.
- **mutateFlies**: Apply mutation to the population, with the best fly serving as the basis for the next generation.

---

## Fly
### Parameters:
- **Maximum steps**: Defines how many steps a fly can take.
- **Maximum speed**: Defines the upper speed limit for each fly.

### Attributes:
#### Normal:
- **Position**: Current location of the fly.
- **Velocity**: Speed and direction of the fly's movement.
- **Acceleration**: Rate of change in velocity.
- **Fly radius**: The visual size of the fly.
- **Fitness**: A metric evaluating how successful the fly was in reaching the goal (food).

#### Boolean:
- **isDead**: Whether the fly has exhausted its steps or collided with an obstacle.
- **reachedGoal**: Whether the fly successfully reached the food.
- **isBest**: Indicates if the fly is the top performer in the current generation.

### Functions:
- **move**: Apply velocity and acceleration to change the fly's position.
- **update**: Update fly's position and status.
- **calculateFitness**: Measure how close the fly got to the food.
- **clone**: Create a copy of the fly for reproduction.

---

## Brain
### Attributes:
- **Directions**: An array storing the movement instructions for the fly.
- **Present step**: Tracks the current step the fly is executing.
- **Size**: The total number of steps available to the fly.

### Functions:
- **randomize**: Generate random directions for the fly's movement.
- **clone**: Copy the brain's instructions to the next generation.
- **mutate**: Introduce random variations into the movement instructions.

---

## Helper Functions
### dist
- **Purpose**: Calculate the distance between two points (used to measure how close the fly gets to the food).

### randomVector
- **Purpose**: Generate random directional vectors for the flies' movements.

### debug
- **Purpose**: Debugging function for displaying simulation data.
