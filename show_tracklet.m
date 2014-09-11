function show_tracklet(im, tracklets)
    
    tracklets = sortStruct(tracklets, 'id');
    ntracklets = length(tracklets);
    
    for i=1:ntracklets
        subplot(2,ntracklets,i, 'position', [0.05+0.05*(i-1) 0.75 0.1 0.1]);
        subimage(tracklets(i).im);
        title(num2str(tracklets(i).id),'color','r');
        confidence = num2str(tracklets(i).conf);
        xlabel(confidence(2:4));
        set(gca,'XTick',[]);
        set(gca,'YTick',[]);
    end    
      
    
    subplot(2,1,2, 'position', [0.2 0.05 0.6 0.6]);
    imshow(im);
    
    persistent colors;
    if isempty(colors)
        colors = hsv(64);
        colors = colors(randperm(size(colors,1)),:);
    end
    
    for i=1:ntracklets
        id = tracklets(i).id;
        if id 
            rectangle('Position',tracklets(i).bb(1:4),'LineWidth',2,'LineStyle','-','EdgeColor',colors(id,:));  
            text(tracklets(i).y,tracklets(i).x,num2str(id),'fontsize',16,'color',colors(id,:));
        else
            rectangle('Position',tracklets(i).bb(1:4),'LineWidth',2,'LineStyle','--','EdgeColor','W');              
        end
    end
    
    debug=0;                    
    drawnow; 

end