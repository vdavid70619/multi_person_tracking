function fileList = my_dir(para)
    fileList = dir(para);
    [folder,~,~] = fileparts(para); 

    % remove all folders
    isBadFile = cat(1,fileList.isdir); %# all directories are bad

    % loop to identify hidden files 
    for iFile = find(~isBadFile)' %'# loop only non-dirs
       % on OSX, hidden files start with a dot
       isBadFile(iFile) = strcmp(fileList(iFile).name(1),'.');
       if ~isBadFile(iFile) && ispc
       % check for hidden Windows files - only works on Windows
       [~,stats] = fileattrib(fullfile(folder,fileList(iFile).name));
       if ischar(stats)
           error(stats)
       end
       if stats.hidden
          isBadFile(iFile) = true;
       end
       end
    end
end