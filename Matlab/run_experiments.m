function [ agg_results ] = ...
    run_experiments( config )

tic;

if( nargin == 0 )
    config = config_getdefault;
end

shows = get_allshows(config);

experiment_results = cell(length(shows),1);

for s=1:length(shows) 
    experiment_results{s} = execute_show( s, config );
end

agg_results = get_aggregateresults(experiment_results, config);

agg_results.execution_time = toc;

end


