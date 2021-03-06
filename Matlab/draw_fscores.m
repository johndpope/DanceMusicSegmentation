function draw_fscores(ag_results, save_fig)
%results_drawfpcurves draw f scores for all modes

if nargin < 1
   save_fig=0; 
end

    plot(ag_results.F1Score_Ours.Scores,'k','LineWidth',2);

    hold on;
    plot(ag_results.F1Score_OursEstimated.Scores,'k-');
    plot(ag_results.F1Score_Novelty.Scores,'k-.','LineWidth',2);
    plot(ag_results.F1Score_Guesses.Scores,'k:','LineWidth',3);
    plot(ag_results.F1Score_NoveltyNoRadius.Scores,'k--x');
  
    legend( 'Our Algorithm','Our Algorithm (Track # Estimated)', ...
         'Novelty Peak Finding Enhanced', ...
        'Guessing', 'Novelty No Radius', ...
         'location','SouthEast' );
    ylabel('F-Measure');
    xlabel('Threshold (Seconds)');
    title('F_1 Score Method Comparison Over Time Thresholds');

    hold off;
    axis tight;
    grid on;
    
    if save_fig==1
        c=clock;
        savefig( sprintf('results/fig_fscores_%s%d%d.fig', ...
            date, c(4), c(5) ) );
    end
    
    legend()
end
