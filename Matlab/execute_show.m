function [ results ] = ...
    execute_show( show, config )

    if( nargin < 2 )
        config = config_getdefault;
    end

tic;

% can pass in a show index and we load it, or just the show
% itself which will save time loading it
    if isnumeric( show ) 
       show = get_show(show, config); 
    end

% execute a given show, read the file, extract the features,
% generate the cosine (similarity) matrix, generate the cost
% matrices, add them together, (all with a given config) 
% and evaluate performance, and return that

    results = show_results();
 
    show = get_cosinematrix( show, config );
    
    show.audio = nan;
        
    CN = getcost_sum( show, config, ...
        config.use_costsum, ...
        config.costsum_incentivebalance, ...
        config.costsum_normalization ); 
    
    CS = getcost_symmetry3( show, config );  
    CDG = getcost_contigdiag1( show, config );  
    SCS = getcost_contigstatic2( show, config );  
    SCG = getcost_gaussian( show, config );
    
    show.CostMatrix = CN+CS+CDG+SCS+SCG;
    
    results = compute_trackplacement( config, show, results );
    
    if config.estimate_tracks
        results = estimate_numbertracks( show, results, config );
    end
    
    if( config.compute_confs )
        
        output_width = 200;
        
        results = ...
            find_posterior( show, config, output_width, results );

    end
    
    results.config = config;
    results.show = show;
    results.execution_time = toc;
    
    if config.drawSimMat == 1 
       
        results.vis();
    end
    
    if config.memory_efficient == 1
        
        results.show.CosineMatrix=nan;
        results.show.CostMatrix=nan;
    end
     
end
