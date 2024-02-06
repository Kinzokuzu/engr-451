function y = flipit(x)
% FLIPIT Flip a Matlab sequence structure x so y = x[-n]
    y.data = flip(x.data);
    y.offset = -(length(x.data) - x.offset + 1);
end
