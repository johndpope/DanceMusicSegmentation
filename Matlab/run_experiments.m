function [ agg_results ] = ...
    run_experiments( ...
        config, description, ...
        trackestimate_config, ...
        novelty_config, f_score )
%run_experiments run the experiments for the dataset requested in the
%configuration and return the results in an object
tic;

if( nargin == 0 )
    config = config_getdefault;
end

if( nargin < 2 )
    description = 'None Given';
end

if( nargin < 3 )
    trackestimate_config = [];
end

if( nargin < 4 )
    novelty_config = [];
end

if( nargin < 5 )
    f_score = 0;
end

shows = get_allshows(config);

experiment_results = [];

parfor s=1:length(shows)
    experiment_results = ...
        [ experiment_results ...
            execute_show( ...
            s, config, ...
            trackestimate_config, novelty_config ) ];
end
    
agg_results = get_aggregateresults( ...
    description, ...
    experiment_results, ...
    config, ...
    0, f_score );

agg_results.asot = get_aggregateresultsbyshow( agg_results, 1, f_score );
agg_results.magic = get_aggregateresultsbyshow( agg_results, 2, f_score );
agg_results.tatw = get_aggregateresultsbyshow( agg_results, 3, f_score );
agg_results.lindmik = get_aggregateresultsbyshow( agg_results, 4, f_score );

agg_results.execution_time = toc;

end


