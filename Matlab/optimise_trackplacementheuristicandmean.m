function [score] = optimise_trackplacementheuristicandmean( ibev )

    % this function will be driven from ga (genetic algorithm) to find
    % some decent parameters for optimal track placement performance
    
    score = 0;
    
    % ibev = config_optimdrivebounds_randomstart;
    config = config_optimdrive(ibev);
    
    agresults = run_experiments( config );
   
    score = agresults.heuristic_meanoverall + ...
        agresults.mean_overall;
   
end