function reproduce_seaweed(lambda, v,  nPoints=10^5, bandspec=true, pointspec=true,...
                           limops=true, write2file=true, file_prefix='', visualize=false)
                           
 %loop over all scalings
for i=1:length(lambda)
  %initialize arrays;
  ev = [];
  nev = [];
  bands = [];

  %#####################
  %calculate spectral data
  %#####################
  if (pointspec)
    if (limops)
      ev = unionPointSpecPeriodicScaledOneSided(v, lambda(i));
      neg_ev = unionPointSpecPeriodicScaledOneSided(fliplr(v), lambda(i));
      ev = unique([ev,neg_ev]);
    else
      [ev, nev] = pointSpecPeriodicScaledOneSided(v, lambda(i));
    end
  end
  
  if (bandspec)
    bands = bandsPeriodicScaledTwoSided(v,lambda(i),nPoints);
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
      dlmwrite([file_prefix,'points.csv'], [lambda(i),length(ev), reshape(ev,1,prod(size(ev)))], '-append');
      %dlmwrite('rpoints.csv', [lambda(i),length(nev), reshape(nev,1,prod(size(nev)))], '-append');
    end
  
    if (bandspec)
      dlmwrite([file_prefix,'bands.csv'], [lambda(i),size(bands,1), reshape(transpose(bands),1,prod(size(bands)))], '-append');
    end   
  end

  %#####################
  %plot results
  %#####################
  if (visualize)
    if(bandspec)
      for j=1:size(bands,1)
        hold on
        plot(bands(j,:),[lambda(i),lambda(i)],'b', 'LineWidth',5);
        hold off
      end
    end
    
    if (pointspec)
      for e=ev
        %plot eigenvalues
        hold on
        plot(e,lambda(i),'g','markersize',20);
        hold off
      end
    end

    %general plot options
    grid on
    if (length(lambda) > 1)
      ylim([min(lambda),max(lambda)]);
    end    
    xlabel('E');
    ylabel('\lambda');
    title(['Spectrum of (scaled) One-Sided Schrödinger with potential v=(' , num2str(v), ')'])
    pause(0.01)
  end
  
  %write progress to console
  clc;
  disp([num2str(i/length(lambda)*100), '% complete']);
end

end