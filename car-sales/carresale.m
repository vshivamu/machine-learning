data = csvread('Car_sales.csv');
%Eliminate rows where the resale value is not found
data = data(data(:, 4) > 0, :);
data = data(data(:, 6) > 0, :);
% x1 = Price of the car x2 = Fuel efficiency y = 4-year resale value
X=data(:, 6); y = data(:, 4);
m = length(y);
disp(m);

plotData(X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Price')
ylabel('Resale value')

% Specified in plot order
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

X = [ones(m, 1), data(:,6)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1500;
alpha = 0.00226;

fprintf('\nTesting the cost function ...\n');
% compute and display initial cost
J = computeCost(X, y, theta);
fprintf('With theta = [0 ; 0]\nCost computed = %f\n', J);
     
% further testing of the cost function
J = computeCost(X, y, [-1 ; 2]);
fprintf('\nWith theta = [-1 ; 2]\nCost computed = %f\n', J);

fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
[theta, J] = gradientDescent(X, y, theta, alpha, iterations);
disp(J);
% print theta to screen
fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

% Predict values for car prices of 25000
predict1 = [1, 25] *theta;
fprintf('For price = 25,000, we predict a resale value of %f\n',...
    predict1*1000);
