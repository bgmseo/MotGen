function trackmovie(imagefile,tracks,pixels_per_micron)
% trackmovie(file,trackvariable,pixels_per_micron)
% loads file.avi one frame at a time; superimposes the bead number and a
% colored dot for the track, and saves to file.mov.  Slow.

invert='false';
labelbeads=1;

switch invert
    case 'true',
        movfile=[imagefile 'i_tracked.avi'];
    case 'false',
        movfile=[imagefile '_tracked.avi'];
end;
nbeads=length(tracks);
allframes=1:max([tracks.frame]);
n=length(tracks);
colors=prism(n);
mov=avifile(movfile);
for iframe=allframes, % loop over all frames
    hold off;
    disp(iframe)
    switch invert
        case 'true',
            imshow(-imageread(imagefile,iframe)); hold on; % inverts image black<->white
        case 'false',
            imshow(imageread(imagefile,iframe)); hold on; 
    end;
    for i=1:nbeads; % loop over all beads
        found=find(tracks(i).frame<=iframe); 
        plot(pixels_per_micron*tracks(i).x(found),pixels_per_micron*tracks(i).y(found), ...
            'Marker','.','MarkerSize',6,'Color',colors(i,1:3),'LineStyle','none'); 
        if labelbeads,
            found=find(tracks(i).frame==iframe);
            text(pixels_per_micron*tracks(i).x(found),pixels_per_micron*tracks(i).y(found),int2str(i),'color','r');
        end;
    end; 
    mov=addframe(mov,getframe);
end
% mov=close(mov);