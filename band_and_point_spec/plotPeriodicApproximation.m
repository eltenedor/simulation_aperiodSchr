%plot spectra of periodic approximations

%rewrite of plot spectrum
% run this script to generate Figure 2 
%parameters
bandspec    = true;  %determine bands
pointspec   = true ;  %determine pointspec
visualize   = true; %real-time plot
write2file  = false ;  %generate .csv output
limops      = true ;  %all cyclic permutationsn

alpha = ones(1,11);
lambda = 1;

%delete old .csv files
if (write2file)
  yes = input('delete all .csv-files y/n: ', "s");
  if (strcmp(yes, 'y'))
    delete('*.csv')
    disp('Deleting all .csv-files...')
  else
    disp('Appending to .csv-files...')
  end
end

%loop over all scalings
for m=1:length(alpha)
  v = constructWord(alpha(1:m));
  %initialize arrays;
  ev = [];
  nev = [];
  bands = [];

  %#####################
  %calculate spectral data
  %#####################
  if (pointspec)
    if (limops)
      ev = unionPointSpecPeriodicScaledOneSided(v, lambda);
    else
      [ev, nev] = pointSpecPeriodicScaledOneSided(v, lambda);
    end
  end
  
  if (bandspec)
    bands = bandsPeriodicScaledTwoSided(v,lambda);
  end
    
  %#####################
  %write results to file
  %#####################  
  if (write2file)
    %this output can be used in order to draw (and fill) regions in a tikz plot
    % structure of bands.csv [lambda, number of bands, band1-left-boundary, band1-right-boundary, ...]
    % structure of points.csv [lambda, number of eigenvalues, eigenvalue1, ...]
    %
    if (pointspec)
      dlmwrite('points.csv', [m,length(ev), reshape(ev,1,prod(size(ev)))], '-append');
      %dlmwrite('rpoints.csv', [m,length(nev), reshape(nev,1,prod(size(nev)))], '-append');
    end
  
    if (bandspec)
      dlmwrite('bands.csv', [m,size(bands,1), reshape(transpose(bands),1,prod(size(bands)))], '-append');
    end
    
  end

  
  %#####################
  %plot results
  %#####################
  if (visualize)
    if(bandspec)
      for j=1:size(bands,1)
        hold on
        plot(bands(j,:),[m,m],'b', 'LineWidth',5);
        hold off
      end
    end
    
    if (pointspec)
      for e=ev
        %plot eigenvalues
        hold on
        plot(e,m,'g','markersize',20);
        hold off
      end
    end

    %general plot options
    grid on
    if (length(lambda) > 1)
      ylim([min(lambda),max(lambda)]);
    end    
    xlabel('E');
    ylabel('m');
    title(['Spectrum of (scaled) One-Sided Schrödinger with potential v=(' , num2str(v), ')'])
    pause(0.01)
  end
  
  %write progress to console
  clc;
  disp([num2str(m/length(alpha)*100), '% complete']);
end
