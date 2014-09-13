function [results] = estimate_numbertracks( ...
    show, results, config )

    how_many = 30;
    best_results = nan(how_many,1);

    for i=14:30

        [F, ~] = find_tracks( i, show.CostMatrix );

        best_results(i) = F/i;
    end

    [~, index] = min(best_results);
    
    if config.drawSimMat==1
        figure(2)
subplot(2,5,[10]);
        
        plot(best_results,'k:');
        hold on;

        plot(length(show.indexes)+1, best_results(length(show.indexes)+1),'*k');
        plot(index, best_results(index),'+k');
        hold off;
        title(strcat(show.showname,''));
        xlabel('Number Of Tracks')
        ylabel('Sum cost normalized by number tracks');
        axis square;

        legend('cost curve', ...
            sprintf('actual (%d)', length(show.indexes)+1), ...
            sprintf('minima (%d)', index ))
       % exportfig(gcf,sprintf('%d_tracks.eps', show.number) );
    end

    results.track_estimate = index;
    results.track_estimate_error = abs(results.track_estimate ...
        - (length(show.indexes)+1) );
end