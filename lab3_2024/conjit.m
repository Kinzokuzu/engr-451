function y = conjit(x)
    y.data = x.data;
    for i = 1:length(y.data)
        y.data(i) = y.data(i)';
    end
    y.offset = x.offset;
