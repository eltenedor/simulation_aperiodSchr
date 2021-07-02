% K4
export_spectrum('data/K4_lambda.csv', 'data/K4_v.csv',nPoints=10^5);
createTexPointSpec('points.csv')
createTexBandSpec('bands.csv')
movefile('bands.csv','data/K4_bands.csv')
movefile('points.csv','data/K4_points.csv')
movefile('bands.tex','data/K4_bands.tex')
movefile('points.tex','data/K4_points.tex')

