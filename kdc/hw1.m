function ee_points = hw1(filename)
data = dlmread(filename)
%disp data
data_length = length(data(:,1))
ee_points = zeros(3,data_length)
for i = [1:data_length]
    ee_pose = fk(data(i,:))
    ee_points(:,i) = ee_pose(1:3,4)
end
end