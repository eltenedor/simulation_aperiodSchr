function export_spectrum(lambda_file, v_file,nPoints=10^5)
  
  lambda = dlmread(lambda_file);
  v = dlmread(v_file);
  reproduce_seaweed(lambda, v,  nPoints);
  
end
