function z = trimit(x)
% TRIMIT Remove leading and trailing zeros from sequence x and adjust offset appropriately.
    trim_idx = find(x.data);
    z.data = x.data(trim_idx(1):trim_idx(end));
    z.offset = x.offset + trim_idx(1) - 1; % -1 because of 1-based indexing
