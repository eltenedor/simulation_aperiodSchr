function createTexTrajectory(filename='points.csv')

data = dlmread(filename);
[prefix, baseFile, ~] = fileparts(filename);

out = fullfile(prefix, [baseFile, '.tex']);
FID = fopen(out,'w');

fprintf(FID,'\\draw[pointSpecCol] (%d, %d)\n', data(1,2), data(1,1));
for k=2:size(data,1)
 fprintf(FID,'-- (%d, %d)\n', data(k,2), data(k,1));
end
fprintf(FID,';\n');

fclose(FID);

end
