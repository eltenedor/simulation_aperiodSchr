function createTexPointSpec(filename='points.csv')

filename = 'points.csv';

data = dlmread(filename);
[~, baseFile, ~] = fileparts(filename);

out = [baseFile, '.tex'];

FID = fopen(out,'w');


for b=1:data(1,2)
    fprintf(FID,'%s\n' , '% next trayectory');
    fprintf(FID,'\\draw[pointSpecCol] (%d, %d)\n', data(1,b+2), data(1,1));
    for k=2:size(data,1)
     fprintf(FID,'-- (%d, %d)\n', data(k,b+2), data(k,1));
    end
    fprintf(FID,';\n');
end     

fclose(FID);

end    