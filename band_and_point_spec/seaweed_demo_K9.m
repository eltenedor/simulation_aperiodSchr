%K9

reproduce_seaweed(0.01, [1,1,0,1,0,1,0,1,1],  3*10^5);
export_spectrum('data/K9_lambda.csv', 'data/K9_v.csv',nPoints=10^5);
createTexPointSpec('points.csv')
createTexBandSpec('bands.csv')
movefile('bands.csv','data/K9_bands.csv')
movefile('points.csv','data/K9_points.csv')
