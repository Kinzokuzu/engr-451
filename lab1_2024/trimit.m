function z = trimit(x)
% TRIMIT Remove leading and trailing zeros from sequence x and adjust offset appropriately.
    trim_idx = find(x.data);
    % If x is all zeros, return [0] with offset 0
    if isempty(trim_idx)
        z = x;
        z.data = 0;
        z.offset = 0;
        return
    end

    z.data = x.data(trim_idx(1):trim_idx(end));
    z.offset = x.offset + trim_idx(1) - 1; % -1 because of 1-based indexing
