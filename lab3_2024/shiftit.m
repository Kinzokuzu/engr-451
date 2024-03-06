function y = shiftit(x, n0)
% SHIFTIT Shift a Matlab sequence structure x by integer amount n0 so that y[n] = x[n - n0]
    y.data = x.data;
    y.offset = x.offset + n0;
