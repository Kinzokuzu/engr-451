function z = multit(x, y)
% MULTIT Multiply x and y (i.e. .*) Ether x and y will both be sequence structures of one of them may be a number.
    if isnumeric(x)
        z.data = x .* y.data;
        z.offset = y.offset;
        z = trimit(z);
        return
    elseif isnumeric(y)
        z.data = x.data .* y;
        z.offset = x.offset;
        z = trimit(z);
        return
    end

    % case where x and y are both sequence structures
    % make sure x and y are the same length
    if x.offset > y.offset
        % pad the front of x with zeros
        x.data = [zeros(1, x.offset - y.offset), x.data];

        if length(x.data) > length(y.data)
            % pad the end of y with zeros
            y.data = [y.data, zeros(1, length(x.data) - length(y.data))];
        elseif length(x.data) < length(y.data)
            % pad the end of x with zeros
            x.data = [x.data, zeros(1, length(y.data) - length(x.data))];
        end

    elseif x.offset < y.offset
        % pad the front of y with zeros
        y.data = [zeros(1, y.offset - x.offset), y.data];

        if length(x.data) > length(y.data)
            % pad the end of y with zeros
            y.data = [y.data, zeros(1, length(x.data) - length(y.data))];
        elseif length(x.data) < length(y.data)
            % pad the end of x with zeros
            x.data = [x.data, zeros(1, length(y.data) - length(x.data))];
        end
    else
        if length(x.data) > length(y.data)
            % pad the end of y with zeros
            y.data = [y.data, zeros(1, length(x.data) - length(y.data))];
        elseif length(x.data) < length(y.data)
            % pad the end of x with zeros
            x.data = [x.data, zeros(1, length(y.data) - length(x.data))];
        end
    end

    % add the data
    z.data = x.data .* y.data;
    % set the offset to the minimum of the two
    z.offset = min(x.offset, y.offset);
    z = trimit(z);
