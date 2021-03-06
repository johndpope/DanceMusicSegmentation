classdef aggregate_results
    % results for executing a show
    
    properties
        asot
        tatw
        magic
        lindmik
        description
        results = [];
        config
        mean_all = [];
        mean_overall
        heuristic_meanoverall
        heuristic_all
        track_estimate_errors = [];
        track_estimate_errors_avg
        residuals_ourmethod= [];
        residuals_noveltyfixed = [];
        residuals_naives = [];
        residuals_ourmethod_all = [];
        residuals_ourmethod_all_avg
        track_indexconfidences_sum
        track_placementconfidence_sum
        track_placementconfidenceavg_all
        mean_indexplacementconfidence_all
        track_placementconfidenceavg_mean
        mean_indexplacementconfidence_mean
        execution_time
        convexity_estimate=0
        trackestimate_noveltyerrors=[];
        trackestimate_noveltyerrorsavg
        trackestimate_naiveerrors=[];
        trackestimate_naiveerrorsavg
        global_errormean
        global_errormedian
        global_errorstd
        F1Score_Ours
        F1Score_Novelty
        F1Score_Guesses
        F1Score_OursEstimated
        F1Score_NoveltyKnown
        F1Score_NoveltyNoRadius
    end
end     


