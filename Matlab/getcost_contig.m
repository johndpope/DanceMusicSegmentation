function [SC] = getcost_contig(C, W, min_w) 
%%
T = size(C,1);

SC = nan( T, W );

% matrix of diagonals 
D = nan( W, T );
assert(size(C,1)==size(C,2));
  
 for i=1:W
    D( i, 1:T-(i-1) ) = diag( C, i-1 ); 
 end
 
D = (D)';
 
for t=1:T
   for w=2:W
      
        dg = D( t, 1:w );
       
        d=abs( diff( dg(1:w ) ) );
       
        hi = sum(dg( dg>0.4 ));
        
        SC( t,w ) = ( sum( d(d<0.4) ) / max( 1, hi ) ) ;
        
        if( hi>2 ) 
            SC( t,w )  = 0;
        end
        

   end
end

SC = normalize_costmatrix(SC);

SC = 1-SC;


SC = normalize_costmatrix(SC);

% D = cumsum( 1-D )';

% SC = D;
% SC(SC<0)=0;


%SC = [ nan(T,1) SC ];
SC(SC==1)=inf;
SC(:,1:min_w )=inf;


imagesc(SC)

%%
end