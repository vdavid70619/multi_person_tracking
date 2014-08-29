function demo()
    dataDir = '../../DATA/Crowd_PETS09/S2/L1/Time_12-34/View_001/';
%     dataDir = '../../DATA/CAVIAR/EnterExitCrossingPaths1cor/';
    
%     dataDir = '../../DATA/ETH/SUNNYDAY-img-left/';
%     pics = my_dir([dataDir '*.png']);
    pics = my_dir([dataDir '*.jpg']);
    
    nfiles = length(pics);

%     load('AcfCaltechDetector');
    load('AcfInriaDetector');
%     detector = acfModify(detector,'cascThr',-1,'cascCal',0);
    detector = acfModify(detector,'rescale',0.5);    
    % get samples
    pre_resps = [];
    for i = 1:nfiles
        im = imread(strcat(dataDir, pics(i).name));
        
        bb = acfDetect(im, detector);
        bb(bb(:,5)<20,:) = [];
        
        cur_resps = low_level_feature(im, bb);

        pre_resps = cur_resps;
        
        imshow(im);
        bbApply('draw',bb);   
        hold on;

        plot(alltraject(:,1), alltraject(:,2), '.');
        debug=0;            
        
        drawnow;
        
        
    
    end    
    debug=1;
end