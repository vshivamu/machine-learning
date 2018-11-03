data = textread('datasets/data.csv');
data = strsplit(data, "\n");
for i=1:length(data)
  B(i,:) = strtrim (strsplit (data{i}, ","));
endfor
disp(B(2,:));