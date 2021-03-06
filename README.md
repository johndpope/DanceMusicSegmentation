Dance Music Segmentation
======================

Segmenting electronic dance music streams based on self-similarity

- Tim Scarfe (http://www.developer-x.com)
- Wouter M. Koolen (http://wouterkoolen.info/)
- Yuri Kalnishkan (http://www.clrc.rhul.ac.uk/people/yura/)

We present an unsupervised, deterministic algorithm for segmenting DJ-mixed Electronic 
Dance Music (EDM) streams (for example; pod-casts, radio shows, live events) into their 
respective tracks. We attempt to reconstruct boundaries as close as possible to what a 
human domain expert would create in respect of the same task. The goal of DJ-mixing is 
to render track boundaries effectively invisible from the standpoint of human perception 
which makes the problem difficult.

We use dynamic programming to optimally segment a cost matrix derived from a similarity matrix. 
The similarity matrix is based on the cosines of a time series of kernel-transformed Fourier 
based features designed with this domain in mind. Our method is applied to EDM streams. 
Its formulation incorporates long-term self similarity as a first class concept combined 
with dynamic programming and it is qualitatively assessed on a large corpus of long streams 
that have been hand labelled by a domain expert.

In laymans terms, the purpose of this software is to automatically generate a cue sheet in
the situation that you have downloaded a radio show like A State of Trance and you have only
the track list. Web sites already exist where humans manually create cue sheets i.e. http://cuenation.com/
The problem is you have to rely on them (you can't automate the process). 

See http://www.developer-x.com/papers/segmentationextended for more information and associated papers.

On this github project we supply the working code with a sample test set in ./Matlab/examples.
The project is written in Matlab although some helper functions i.e. for pre-processing the dataset,
extracting cue sheet times etc are included as part of a Visual Studio project.

Simply execute execute_show(1) to see it work. 

Or for more cool stuff: 

s = 1; % change to 1,2,...,6 for the github test set shows

execute_show( s, config_getbest(1,1), 
  config_getdefaultsegcalculation, 
  config_getbestnoveltyconfig );

I have included training set binaries:

- A State of Trance (With Armin van Buuren) 453 + 462
- Trance Around World (with Above and Beyond) 364 + 372
- Magic Island (with Roger Shah) 98 + 112

This is free software. Feel free to fork or contribute. It would be particularly useful if somebody 
is interested in creating an implementation of this in a more serious language like C, Java, C# etc. 
I would be happy to collaborate. Get in touch.

I would like to personally thank Dennis Goncharov for providing me with a dataset complete with cues
for my research and also Mikael Lindgren from CueNation. Both provided me with insight on how they
find the optimal track indices. The dataset I have from Dennis is quite large but sharable on Google Drive.

Some information from Denis about how he makes the cuesheets -- https://docs.google.com/a/developer-x.com/document/d/1vgr7x0nwzoWrVewLFyRS9xO0ehZowdeyKdCGDvSfQN8/edit


![ambigous track](https://sites.google.com/a/developer-x.com/developer-x-com/_/rsrc/1411512447347/papers/segmentationextended/ambigous.png)
