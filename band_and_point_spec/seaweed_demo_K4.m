% K4

% set parameters
file_prefix='data/K4_';
lambda_file = [file_prefix, 'lambda.csv'];
v_file      = [file_prefix, 'v.csv'];
nPoints=10^5;
bandspec=true;
pointspec=true;
limops=true;
write2file=true;
visualize=false;

%read in data
lambda = dlmread(lambda_file);
v = dlmread(v_file);

% calculate spectrum
reproduce_seaweed(lambda, v,  nPoints, bandspec, pointspec,...
                   limops, write2file, file_prefix, visualize)

% create tex
createTexPointSpec([file_prefix,'points.csv'])
createTexBandSpec([file_prefix,'bands.csv'])

