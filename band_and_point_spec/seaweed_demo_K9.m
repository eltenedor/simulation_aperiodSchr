%K9

% set parameters
file_prefix='data/K9_';
lambda_file = [file_prefix, 'lambda.csv'];
v_file      = [file_prefix, 'v.csv'];
nPoints=3*10^5;
bandspec=true;
pointspec=true;
limops=true;
write2file=true;
visualize=false;

%read in data
lambda = 0.01;
v = dlmread(v_file);

% calculate spectrum 2 steps
reproduce_seaweed(lambda, v,  nPoints, bandspec, pointspec,...
                   limops, write2file, file_prefix, visualize)

nPoints=10^5;
lambda = dlmread(lambda_file);
reproduce_seaweed(lambda, v,  nPoints, bandspec, pointspec,...
                   limops, write2file, file_prefix, visualize)

% create tex
createTexPointSpec([file_prefix,'points.csv'])
createTexBandSpec([file_prefix,'bands.csv'])

