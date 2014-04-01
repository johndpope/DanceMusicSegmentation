% this is called after loading in the relevant config and shows
% see ./execute_gittest.m if you have downloaded this project from
% github, otherwise ./experiments/run_resultsforpaper.m

which_shows = 1:length(shows);
howmany_shows = length(which_shows);

output_width = 100;
   
track_indexconfidences_map = zeros( howmany_shows, output_width );
track_placementconfidences_map = zeros( howmany_shows, output_width );
track_placementconfidenceavg_map = zeros( howmany_shows, 1 );
worst_indexplacementconfidence_map = zeros( howmany_shows, 1 );
mean_indexplacementconfidence_map = zeros( howmany_shows, 1 );
predictive_loss = nan( howmany_shows, output_width );
predictive_loss_noabs = nan( howmany_shows, output_width );

heuristic_loss = nan(howmany_shows,1);
average_loss = nan( howmany_shows, 1 );
median_loss = nan( howmany_shows, 1 );
thresholds = nan( howmany_shows,7 );
average_shifts = nan(howmany_shows, 1);

shifts = [];

%%

for s=1:howmany_shows; 
 
    execute_show;

end

fprintf('mean=%.2f, heuristic=%.2f shiftmedian=%.2f', ...
    mean(average_loss), mean(heuristic_loss), median(average_shifts) )

if( howmany_shows > 1 )
    mean(thresholds)
else
    thresholds
end

%%
%%
if( drawSimMat )
    figure(3)
    hist(shifts,1000);
    title('Shift Histogram (Experiment 10)');
    colormap Gray;
    xlabel('Seconds')
    ylabel('Number Tracks')
    axis square;
end

%%
if( compute_confs && size( predictive_loss,1 )>1 )

    predictive_loss_normalised = sum(predictive_loss);
    predictive_loss_normalised = predictive_loss_normalised - min(predictive_loss_normalised);
    predictive_loss_normalised = predictive_loss_normalised ./max(predictive_loss_normalised);
    predictive_performance_normalised =  1-predictive_loss_normalised;

    track_placementconfidences_map_normalised = sum(track_placementconfidences_map);
    track_placementconfidences_map_normalised = track_placementconfidences_map_normalised - min(track_placementconfidences_map_normalised);
    track_placementconfidences_map_normalised = track_placementconfidences_map_normalised./max(track_placementconfidences_map_normalised);

    track_indexconfidences_map_normalised = sum(track_indexconfidences_map);
    track_indexconfidences_map_normalised = track_indexconfidences_map_normalised - min(track_indexconfidences_map_normalised);
    track_indexconfidences_map_normalised = track_indexconfidences_map_normalised ./ max(track_indexconfidences_map_normalised);

    if( draw_confs )
        h = figure(12);
        plot( ( predictive_performance_normalised ),'k', 'LineWidth', 2 );
        hold on;
        plot( ( track_placementconfidences_map_normalised ),'k:', 'LineWidth', 1 );
        plot( ( track_indexconfidences_map_normalised ),'k--' );
        hold off;
        legend('performance','time confidence','index confidence')
        title(sprintf('Summation Cost Matrix Only'))
        xlabel('Show Progression');
        axis square;
set(gca,'xtick',[]);
set(gca,'xticklabel',[]); 

    end

end