function y = dtft(x, w)
    y = x.data * exp(-1j * ([x.offset:length(x.data)+x.offset-1]' * w));
