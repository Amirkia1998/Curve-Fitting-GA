% ############################################################################################################
% Initial Points
% ############################################################################################################

% % Set the number of points
% numPoints = 20;

% % Set the range for the x and y coordinates
% xRange = [-10, 10];
% yRange = [-10, 10];

% % Generate random x and y coordinates within the specified range
% xCoords = (xRange(2) - xRange(1)) * rand(1, numPoints) + xRange(1);
% yCoords = (yRange(2) - yRange(1)) * rand(1, numPoints) + yRange(1);

% % Combine x and y coordinates into a matrix
% points = [xCoords; yCoords]';

% Set the predefined points
points1 = [ -5, 200; -4, 100; -3, 40; -2, 30; -1, 20; 0, 5; 1, 3; 2, 10; 4, 12; 5, 20;
        6, 40; 7, 50; 8, 70; 9, 20; 10, 10; 11, 0; 12, 2; 13, 0; 14, -13; 15, -44; 16, -57; 
        17, -69; 18, -70; 17, -82; 18, -97; 19, -100; 20, -150];

points2 = [-10, 7468; -8, 1646; -6, 314; -4, 22; -2, -4; 0, -2; 2, 2; 4, 42; 6, 230; 8, 786;
        10, 1898; -9, 5654; -7, 1098; -5, 194; -3, 6];

points3 = [ -5, 200; -4, 100; -3, 40; -2, 30; -1, 20; 0, 5; 1, 3; 2, 10; 4, 12; 5, 20;
        6, 40; 7, 50; 8, 70; 9, 20; 10, -80; 11, 0; 12, 2; 13, 0; 14, -13; 15, -44; 16, -57; 
        17, -69; 18, -70; 17, -82; 18, -97; 19, -100; 20, -150];


% Display the generated points on a figure
points = points1;   %---------------------------------------------> YOU CAN CHANGE IT!
figure;
scatter(points(:,1), points(:,2), 'b', 'filled');
xlabel('X');
ylabel('Y');
title('Generated Points');
% ############################################################################################################

          

% ############################################################################################################
% Custom fitness functions
% ############################################################################################################

% Mean Squared Error (MSE): 
% Advantages:
% Emphasizes larger deviations due to squaring the differences.
% Minimizing MSE results in a line that closely fits the points with smaller overall squared deviations.
% Disadvantages:
% Sensitive to outliers, as the squared differences can be significantly influenced by a few outliers.
fitnessFunc1 = @(coefficients) mean((polyval(coefficients, points(:,1)) - points(:,2)).^2);

% Mean Absolute Error (MAE):
% Advantages:
% Less sensitive to outliers compared to MSE due to using absolute differences.
% Minimizing MAE results in a line that minimizes the overall absolute deviations from the points.
% Disadvantages:
% Smaller deviations are not emphasized as much as with the MSE.
fitnessFunc2 = @(coefficients) mean(abs(polyval(coefficients, points(:,1)) - points(:,2)));

% R-squared (Coefficient of Determination):
% Advantages:
% Provides a measure of how well the line fits the points, indicating the proportion of the variance in the data explained by the line.
% Maximizing R-squared results in a line that explains a larger proportion of the variance in the data.
% Disadvantages:
% Does not directly penalize large deviations from the points.
% Can be influenced by the number of points and the complexity of the model.
yMean = mean(points(:,2));
SS_total = sum((points(:,2) - yMean).^2);
fitnessFunc3 = @(coefficients) 1 - sum((polyval(coefficients, points(:,1)) - points(:,2)).^2) / SS_total;

% Root Mean Squared Error (RMSE):
% Advantages:
% Emphasizes larger deviations while still providing a measure in the original unit of the data.
% Minimizing RMSE results in a line that closely fits the points with smaller overall deviations.
% Disadvantages:
% Sensitive to outliers, as the squared differences can be significantly influenced by a few outliers.
fitnessFunc4 = @(coefficients) sqrt(mean((polyval(coefficients, points(:,1)) - points(:,2)).^2));

% Maximum Absolute Error (MaxAE)
% Advantages:
% Captures the worst-case deviation between the line and any individual point.
% Minimizing MaxAE results in a line that minimizes the largest deviation.
% Disadvantages:
% Does not consider the overall trend of deviations, as it only focuses on the maximum deviation.
% Ignores the impact of other points that might have smaller deviations.
fitnessFunc5 = @(coefficients) max(abs(polyval(coefficients, points(:,1)) - points(:,2)));

% ############################################################################################################



% ############################################################################################################
% Applying Genetic Algorithm
% ############################################################################################################

% Fitness function ---------------------> (YOU CAN CHANGE IT!)
fitnessFunc = fitnessFunc1; 

% Number of variables (degree of the polynomial)
numVariables = 4;

% Bounds for the variables (coefficients of the polynomial)
variableBounds = [-20, 20; -20, 20; -20, 20; -20, 20];

% Options for the genetic algorithm
gaOptions = optimoptions('ga', 'PopulationSize', 50, 'MaxGenerations', 150);

% Apply genetic algorithm
[x, ~] = ga(fitnessFunc, numVariables, [], [], [], [], variableBounds(:,1), variableBounds(:,2), [], gaOptions);

% Display the predefined points on a figure
figure;
scatter(points(:,1), points(:,2), 'b', 'filled');
hold on;

% Generate x-coordinates for the line
xLine = linspace(min(points(:,1)), max(points(:,1)), 100);

% Evaluate the y-coordinates of the line using the obtained coefficients
yLine = polyval(x, xLine);

% Display the line on the figure
plot(xLine, yLine, 'r', 'LineWidth', 2);
xlabel('X');
ylabel('Y');
title('Best Fit Line of Degree 3');
legend('Predefined Points', 'Best Fit Line');


% Retrieve coefficient values
A = x(1);
B = x(2);
C = x(3);
D = x(4);

% Print the coefficients
disp('Coefficient values:');
disp(['A = ', num2str(A)]);
disp(['B = ', num2str(B)]);
disp(['C = ', num2str(C)]);
disp(['D = ', num2str(D)]);

