function y = odd(x)
    y = subit(x, flipit(x))
    y.data = y.data ./ 2;
