% CONFIGURATION SETTINGS

% Feature Extraction Parameters
sampleRate = 4000;
secondsPerTile = 30;
minTrackLength = 180;
maxExpectedTrackWidth = 370*2;   % (magicisland=380*2 others 350*2)
bandwidth = 5; % bandwith for the width of the convolution filter
lowPassFilter = 1500; %Hz
highPassFilter = 80; %Hz
gaussian_filterdegree = 2; % for the convolution filter on FFT result

% figure drawing parameters
drawsimmat = 1;
compute_confs=0;
draw_confs = 0;

% save precomputed cosine matrices in memory for speed
% useful for repetition experiments
% note that the conv and dft get faster with decreasing tile size
use_cosinecache = 1;

% learning rate for posterior
eta = 10;

% shift the solutions by x seconds, seems useless
solution_shift = 0;
% gaussian width (>1) higher values pinch the gaussian
use_costgaussianwidth = 1;
cosine_normalization = 1;
contig_windowsize = 4;

% which cost functions to use and how much weight do they have (>0)
use_costsymmetrysum = 1;
use_costsymmetrydiff = 1;
use_costsymmetry = 1;
use_costcontigpast = 1;
use_costcontigfuture = 1;
use_costsum = 1;
use_costgaussian = 1;

% what incentive balance do the respective cost functions have [0,1]
costsymmetrysum_incentivebalance = 0.5;
costsymmetry_incentivebalance = 0.5;
costcontigfuture_incentivebalance = 0.5;
costcontigpast_incentivebalance = 0.5;
costsymmetrydiff_incentivebalance = 0.5;
costsum_incentivebalance = 0.5;
costgauss_incentivebalance = 0.5;