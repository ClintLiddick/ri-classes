function ee_points = hw1(filename)
data = dlmread(filename);
data_length = length(data(:,1));
ee_points = zeros(3,data_length);
for i = [1:data_length]
    ee_pose = fk(data(i,:));
    ee_points(:,i) = ee_pose(1:3,4);
end
% uncomment to generate 2d plot
%scatter(ee_points(1,1:data_length),ee_points(2,1:data_length),4,'blue','filled');

% uncomment to generate 3d plot
%scatter3(ee_points(1,1:data_length),ee_points(2,1:data_length),ee_points(3,1:data_length),4,'blue','filled');
end