function hhist = hsv_hist(im, varargin) 

    NBINs   = [16,16,4]; % hsv quantization

    img_hsv = rgb2hsv(im);
    tmp = img_hsv(:,:,3);
    tmp = histeq(tmp); % color equalization
    img_hsv = cat(3,img_hsv(:,:,1),img_hsv(:,:,2),tmp); % eq. HSV    
    im=img_hsv;
%     im(repmat(mask==1,[1 1 size(im,3)]))=NaN;
    
    [h, w, c] = size(im);
   
    hhist = [];
    for ch = 1:c
        bins = [0:1/(NBINs(ch)-1):1];                   
        [hist1c, ~] = hist(reshape(im(:,:,ch),1,[]), bins);
        %hist1 = [hist1c./sum(hist1c) hist1];
        hhist = [hist1c hhist];
    end
    hhist = hhist./sum(hhist+1e-6);
end