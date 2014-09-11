function cur = remove_useless(cur)
    cur([cur.id]==0) = [];
    debug = 0;
end