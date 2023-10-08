# Curve Fitting using Genetic Algorithm in MATLAB

This MATLAB project demonstrates the application of a Genetic Algorithm (GA) for curve fitting. Curve fitting involves finding a mathematical function that best approximates a given set of data points. Genetic Algorithms are optimization techniques inspired by the process of natural selection and evolution.

## Genetic Algorithms (GAs) - An Overview

Genetic Algorithms are search algorithms inspired by the mechanics of natural selection. They are used to find approximate solutions to optimization and search problems. Here are the key steps involved in a Genetic Algorithm:

1. **Initialization:** Create an initial population of potential solutions (often called "individuals" or "chromosomes").

2. **Fitness Function:** Define a fitness function that quantifies how well each solution performs with respect to the problem. In this project, we explore various fitness functions for curve fitting.

3. **Selection:** Select individuals from the population to form a new generation. The selection process is typically biased towards individuals with higher fitness values.

4. **Crossover (Recombination):** Create new individuals by combining the genetic information of two or more selected parents. This mimics the idea of reproduction in nature.

5. **Mutation:** Introduce random changes to some individuals' genetic information to introduce diversity into the population.

6. **Termination:** Determine when to stop the algorithm. This can be based on the number of generations, a target fitness value, or other criteria.

7. **Result:** The best solution found by the GA is considered an approximation to the optimal solution of the problem.

## Project Code Explanation

The MATLAB code in this project showcases the use of a Genetic Algorithm for curve fitting. Here's a breakdown of the key components:

- **Initial Points:** The script begins by defining a set of data points, `points1`, `points2`, and `points3`, representing the data to be fitted with a curve.

- **Custom Fitness Functions:** Different fitness functions are defined, including Mean Squared Error (MSE), Mean Absolute Error (MAE), R-squared (Coefficient of Determination), Root Mean Squared Error (RMSE), and Maximum Absolute Error (MaxAE). These fitness functions quantify how well a polynomial curve fits the data.

- **Applying Genetic Algorithm:** You can choose a fitness function and specify the degree of the polynomial (number of variables) to fit the data. The GA parameters, such as population size and maximum generations, can also be adjusted.

- **Results:** The script runs the GA to find the best-fit polynomial curve and displays the predefined points along with the fitted curve. It also prints the coefficients of the polynomial curve.

## Usage

To use this code for curve fitting with a Genetic Algorithm:

1. Choose a fitness function: You can select one of the predefined fitness functions (`fitnessFunc1`, `fitnessFunc2`, etc.) or create your own.

2. Specify the number of variables: Set `numVariables` to the degree of the polynomial you want to fit.

3. Define variable bounds: Set `variableBounds` to specify the bounds for the coefficients of the polynomial.

4. Customize GA options: Adjust the options for the genetic algorithm (`gaOptions`) as needed.

5. Run the script: Execute the MATLAB script to perform curve fitting using the chosen fitness function and GA settings.

![screenshot](https://github.com/Amirkia1998/Curve-Fitting-GA/blob/main/screenshot.png)

## License

This project is open-source and is provided under the [MIT License](LICENSE). Feel free to customize and extend the code for your specific curve fitting tasks.

Happy curve fitting with Genetic Algorithms!
