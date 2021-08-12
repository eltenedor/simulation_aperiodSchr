% K5

% set parameters
file_prefix='data/';

% create tex
createTexTrajectory([file_prefix,'11010_1.csv'])
createTexTrajectory([file_prefix,'11010_3.csv'])
createTexTrajectory([file_prefix,'10110_0.csv'])
createTexTrajectory([file_prefix,'10110_2.csv'])
createTexTrajectory([file_prefix,'01011_0.csv'])
createTexTrajectory([file_prefix,'01011_1.csv'])
createTexTrajectory([file_prefix,'10101_2.csv'])
createTexTrajectory([file_prefix,'10101_3.csv'])
createTexBandSpec([file_prefix,'K5_bands.csv'])

