function ee_points = hw1(filename)
data = dlmread(filename);
data_length = length(data(:,1));
%data_length = 1000
ee_points = zeros(3,data_length);
for i = [1:data_length]
    ee_pose = fk(data(i,:));
    ee_points(:,i) = ee_pose(1:3,4);
end
scatter(ee_points(1,1:data_length),ee_points(2,1:data_length),4,'blue','filled');
end