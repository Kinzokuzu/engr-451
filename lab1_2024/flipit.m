function y = flipit(x)
% FLIPIT Flip a Matlab sequence structure x so y = x[-n]
     y.data = flip(x.data);
     y.offset = -(length(x.data) + x.offset - 1);
  %  y = x(end:-1:1);
end
