function y = shiftit(x, n0)
% SHIFTIT Shift a Matlab sequence structure x by integer amount n0 so that y[n] = x[n - n0]
    if n0 > 0
        y.data = [zeros(1, n0), x.data];
    elseif n0 < 0
        y.data = [x.data, zeros(1, -n0)];
    else
        y.data = x.data;
    end

    y.offset = x.offset;
