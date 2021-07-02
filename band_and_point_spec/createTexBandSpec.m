function createTexBandSpec(filename='bands.csv')

data = dlmread(filename);
[~, baseFile, ~] = fileparts(filename);

out = [baseFile, '.tex'];
FID = fopen(out,'w');

for b=1:data(1,2)
   fprintf(FID,'\\drawBand (%d, %d)\n', data(1,(2*b)+1), data(1,1));
   %fprintf(FID,'\\draw[pattern=north east lines, pattern color=gray]   (%d, %d)\n', data(1,(2*b)+1), data(1,1));
  for k=2:size(data,1)
   fprintf(FID,'-- (%d, %d)\n', data(k,2*b+1), data(k,1));
  end
  fprintf(FID,'%s\n' , '% turn around');

  for k=size(data,1):-1:1
   fprintf(FID,'-- (%d, %d)\n', data(k,(2*b)+2), data(k,1));
  end
  fprintf(FID,'-- cycle;\n');
end

fclose(FID);

end