function y = even(x)
    y = addit(x, flipit(x));
    y.data = y.data ./ 2;
