function [SC] = getcost_sum3( C, W, min_w, costsum_incentivebalance ) 
% getcost_sum3 dynamic programming implementation of getcost_sum2 which
% runs in O(TW)

%%
T = size( C, 1 );
SC = inf( T, W );

SF = getmatrix_selfsim( C, W, 1 );

%%

for t=1:T
    
    score = 0;
    
    for w=1:min(W, t)
        
        score = score + sum( SF( t-(w-1), 1:w ) );
        
        SC( (t-w)+1, w ) = score / w;
    end
end

SC = normalize_byincentivebias(SC, costsum_incentivebalance);

SC(:,1:min_w-1 )=inf;

end