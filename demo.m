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
 
    pre_tracs = [];
    for i = 1:nfiles
        im = imread(strcat(dataDir, pics(i).name));
        
        bb = acfDetect(im, detector);
        bb(:,1:4) = floor(bb(:,1:4));
%         bi = nms(round(bb), 0.1);
%         bb = bb(bi,:);
        bb(bb(:,5)<15,:) = [];
        cur_tracs = low_level_feature(im, bb);
        show_tracklet(im, cur_tracs);
    
    end    
    debug=1;
end