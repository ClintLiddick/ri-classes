function ee_points = hw1(filename,print_results,plot2d,plot3d)
data = dlmread(filename);
data_length = length(data(:,1));
ee_points = zeros(3,data_length);       % preallocate memory
for i = [1:data_length]
    ee_pose = fk(data(i,:));
    ee_points(:,i) = ee_pose(1:3,4);    % only care about translation
end

% optionally do data exports
if nargin > 1 & print_results
    dlmwrite('results.txt',transpose(ee_points), 'delimiter', ' ');
end

if nargin > 2 & plot2d
    scatter(ee_points(1,1:data_length),ee_points(2,1:data_length),4,'blue','filled');
elseif nargin > 3 & plot3d
    scatter3(ee_points(1,1:data_length),ee_points(2,1:data_length),ee_points(3,1:data_length),4,'blue','filled');
end
end
