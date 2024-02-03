function z = multit(x, y)
% MULTIT Multiply x and y (i.e. .*) Ether x and y will both be sequence structures of one of them may be a number.
    fill_count = max(x.offset, y.offset) - min(x.offset, y.offset);

    pre_fill = [];
    back_fill = [];

    if x.offset > y.offset
        pre_fill = [zeros(1, fill_count), x.data];

        % make sure the two vectors are the same length
        size_diff = length(pre_fill) - length(y.data);
        if size_diff > 0
            back_fill = [y.data, zeros(1, size_diff)];
        elseif size_diff < 0
            pre_fill = [pre_fill, zeros(1, -size_diff)];
            back_fill = y.data;
        end

    elseif y.offset > x.offset
        pre_fill = [zeros(1, fill_count), y.data];

        size_diff = length(pre_fill) - length(x.data);
        if size_diff > 0
            back_fill = [x.data, zeros(1, size_diff)];
        elseif size_diff < 0
            pre_fill = [pre_fill, zeros(1, -size_diff)];
            back_fill = x.data;
        end

    else
        size_diff = length(x.data) - length(y.data);
        if size_diff > 0
            pre_fill = x.data;
            back_fill = [y.data, zeros(1, size_diff)];
        elseif size_diff < 0
            pre_fill = [x.data, zeros(1, -size_diff)];
            back_fill = y.data;
        else
            pre_fill = x.data;
            back_fill = y.data;
        end
    end

    z.data = pre_fill .* back_fill;
    z.offset = min(x.offset, y.offset);
