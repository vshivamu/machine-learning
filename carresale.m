data = csvread('datasets\Car_sales.csv');
% x1 = Price of the car x2 = Fuel efficiency y = 4-year resale value
X=data(:, [6, 13]); y = data(:, 4);