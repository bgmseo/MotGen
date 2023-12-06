
% clc;
% clear all; 
% close all;
%%
positions=locatebeads('exp126_8bit.tif',160/255); 

% bead motion 
tracks=trackbeads(positions,9,1,'plot'); % allow bead motion of up to 9 pixels from frame to frame.

% save tracked data 
save 'tracks_126.mat' tracks;

