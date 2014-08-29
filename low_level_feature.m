function features = low_level_feature(im, bb)
    nb = size(bb,1);
    features = cell(nb,1);
    for i=1:nb
        features{i,1}.x = bb(i,2) + 0.5*bb(i,4);
        features{i,1}.y = bb(i,1) + 0.5*bb(i,3);
        features{i,1}.s = bb(i,3)*bb(i,4);
        features{i,1}.im = im(round(bb(i,2)):round(bb(i,2)+bb(i,4)), ...
                            round(bb(i,1)):round(bb(i,1)+bb(i,3)), ...
                            :);
    end
end