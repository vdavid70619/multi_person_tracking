function show_tracklet(im, tracklets)
    probs = {tracklets.im};
    for nim=1:length(probs)
        subplot(2,length(probs),nim), subimage(probs{nim});
    end    
    set(gca,'XScale',100);

    subplot(2,1,2);
    bbs = {tracklets.bb};
    bbs = cat(1,bbs{:});
    imshow(im);
    bbApply('draw',bbs);   
    debug=0;                    
    drawnow; 

end