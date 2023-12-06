   function tracks=trackbeads(savestats,micron_search_radius,pixels_per_micron,varargin);
% function trackbeads(savestats,micron_search_radius,pixels_per_micron,['plot']);
% savestats is the outputs from the thresholding / COM-finding routine locatebeads.m
% searchradius is the HARD cutoff (in microns, NOT pixels) on the allowable 
%   maximum single-frame displacement
% pixels_per_micron is self explanatory; used to convert searchradius from
%   microns to pixels, and to convert the x,y,area measurement to microns
% I pass micron_search_radius and pixels_per_micron separately because
%   micron_search_radius ought to be constant (for a given bead size and
%   frame rate, anyway), while pixel_search_radius should compensate for the
%   varying magnification.

plotresults=ismember('plot',varargin);
pixel_search_radius=micron_search_radius*pixels_per_micron;

xy=cat(1,savestats.Centroid); x=xy(:,1)'; y=xy(:,2)'; clear xy; % easier to address this way
frame=[savestats.Frame]; area=[savestats.Area];
beadlabel=zeros(size(x)); % vector of bead labels.
i=min(frame); spanA=find(frame==i); % initialize w/ first frame.
beadlabel(1:length(spanA))=1:length(spanA); % refers to absolute indexing of x,y,frame,etc.
lastlabel=length(spanA); % start off with unique bead labels for all the beads in the first frame
for i=min(frame):max(frame)-1, % loop over all frame(i),frame(i+1) pairs.
    spanA=find(frame==i);
    spanB=find(frame==i+1);
    dx = ones(length(spanA),1)*x(spanB) - x(spanA)'*ones(1,length(spanB));
    dy = ones(length(spanA),1)*y(spanB) - y(spanA)'*ones(1,length(spanB));
    dr2 = dx.^2 + dy.^2; % dr2(m,n) = distance^2 between r_A(m) (in frame i) and r_B(n) (in frame i+1)
    dr2test=(dr2<pixel_search_radius^2); % dr2test=1 if beads A and B could be the same.
    [from,to,orphan]=beadsorter(dr2test); % RELATIVE  indices of connected and unconnected beads
    from=spanA(from); to=spanB(to); orphan=spanB(orphan); % translate to ABSOLUTE indices
    beadlabel(to)=beadlabel(from); % propagate labels of connected beads
    if length(orphan)>0, % there is at least one new (or ambiguous) bead 
        beadlabel(orphan)=lastlabel+(1:length(orphan)); % assign new labels for new beads.
        lastlabel=lastlabel+length(orphan); % keep track of running total number of beads
    end;
end;

% From now on, ALL distance and area data will be in microns.
emptybead.x=0; emptybead.y=0; emptybead.area=0; emptybead.frame=0;
tracks(1:lastlabel)=deal(emptybead); % initialize for purposes of speed and memory management.
for i=1:lastlabel, % reassemble beadlabel into a structured array 'tracks' containing all info
    beadi=find(beadlabel==i);
    tracks(i).x=x(beadi)/pixels_per_micron;
    tracks(i).y=y(beadi)/pixels_per_micron;
    tracks(i).area=area(beadi)/pixels_per_micron^2;
    tracks(i).frame=frame(beadi);
end;

if plotresults,
%     figure;
    colors=prism(lastlabel);  hold on;  % plot the tracks to check everything's OK. 
    for i=1:lastlabel, 
        plot(tracks(i).x,tracks(i).y,'Color',colors(i,1:3),'LineStyle','none','Marker','.','MarkerSize',5);
    end;
end;

function [from,to,orphan]=beadsorter(connections);
% All bead tracking is done here.  Everything else is bookkeeping.  NOT ROBUST.  Look here first for problems!
from=find(sum(connections,2)==1); % connected to only ONE bead in next frame:  from(i) -> 1 bead
to=find(sum(connections,1)==1)'; % connected from only ONE bead in previous frame: 1 bead -> to(i)
[i,j]=find(connections(from,to)); % returns list of row,column indices of nonzero entries in good subset of correction
from=from(i); to=to(j);  % translate list indices to row,column numbers.
orphan=setdiff(1:size(connections,2),to); % anyone not pointed to is an orphan


