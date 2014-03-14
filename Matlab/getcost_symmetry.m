%function [ S ] = getcost_symmetry( C, W, min_trackwidth )
%%

[T ~] = size(C);

% matrix of diagonals 
D = nan( W, T );

for i=1:W
   D( i, 1:T-(i-1) ) = diag( C, i-1 ); 
end

% find symmetry matrix
S = inf( T, W );

tic
for w = min_trackwidth:W 

	for t=1:((T-(w+1))-1)
        
        U = zeros( 1, w );
        
        for i=1:min( W, ((T-(w+1))-1) )
            
            DS = D( w, t:(t+w) );
            
            
            U( i ) = DS*fliplr(DS');
       
        end
        
         S( t, w ) = sum(U);
   
    end
end
toc

%S(:,1:w )=inf;
%ms = max( S( ~isinf( S ) ) );
%S = S./ms;

%%
%end