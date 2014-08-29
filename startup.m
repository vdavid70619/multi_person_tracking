function startup()
%   Initialize script to set up environments and libiraries 

  % set up my own path  
  include_mine();
  
  % load required lib
  addpath(genpath('../../LIB/piotr_toolbox'));
end

function include_mine()
  root = fileparts(mfilename('fullpath'));
  addpath(fullfile(root, 'lib'));
  for d = dir(fullfile(root, 'lib'))'
    if d.isdir && d.name(1) ~= '.'
      addpath(fullfile(root, 'lib', d.name));
    end
  end
  %addpath(fullfile(root, 'tasks'));
end
