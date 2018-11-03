data = csvread('Car_sales.csv');
% x1 = Price of the car x2 = Fuel efficiency y = 4-year resale value
X=data(:, 6); y = data(:, 4);
m = length(y);

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

X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters