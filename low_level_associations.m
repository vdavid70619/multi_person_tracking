function cur_with_ids = low_level_associations(pre, cur)

    if isempty(pre)
        for k=1:length(cur)
            cur(k).id = k;
        end
    else
        a_pos = 1;
        a_size = 1;
        a_appr = 1;
        a_conf = 1;
        b_posx = 10;
        b_posy = 10;
        b_size = 10;     
        A_pos = zeros(length(pre),length(cur));
        A_size = zeros(length(pre),length(cur));
        A_appr = zeros(length(pre),length(cur));
        A_conf = zeros(length(pre),length(cur));
        for i=1:length(pre)
            for j=1:length(cur)
                A_pos(i,j) = a_pos*exp(-b_posx*((pre(i).x-cur(j).x)/(mean([pre(i).x cur(j).x])))^2)*exp(-b_posy*((pre(i).y-cur(j).y)/(mean([pre(i).y cur(j).y])))^2);
                A_size(i,j) = a_size*exp(-b_size*((pre(i).s-cur(j).s)/(pre(i).s+cur(j).s))^2);
                A_appr(i,j) = a_appr*bhattacharyya(hsv_hist(pre(i).im), hsv_hist(cur(j).im));
                A_conf(i,j) = a_conf*pre(i).conf*cur(j).conf;
            end
        end
        
%         A_pos(A_pos>0.75) = inf;
        
        A = (1-A_pos).*(1-A_size).*A_appr.*(1-A_conf);
        [assign, cost] = munkres(A');
        new_id = max([pre.id]) + 1;
        for k=1:length(cur)
            if assign(k)==0 && cur(k).bb(5)>50
                cur(k).id = new_id;
                new_id = new_id + 1;
            elseif assign(k)==0
                cur(k).id = 0;    
            else
                cur(k).id= pre(assign(k)).id;
            end
        end
        
        debug = 1;
    end
    cur_with_ids = cur;
    debug = 0;
end


