% K4

% set parameters
file_prefix='data/';

% create tex
createTexTrajectory([file_prefix,'1101_1.csv'])
createTexTrajectory([file_prefix,'1101_2.csv'])
createTexTrajectory([file_prefix,'0111_0.csv'])

createTexBandSpec([file_prefix,'K4_bands.csv'])

