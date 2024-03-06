function y = dtft2(x, w)
    y.real = zeros(1, length(w));
    y.imag = zeros(1, length(w));
    for i = 1:length(w)
        for n = 1:length(x.data)
            y.real(i) = y.real(i) + x.data(n) * cos(-w(i) * (x.offset+n-1));
            y.imag(i) = y.imag(i) + x.data(n) * sin(-w(i) * (x.offset+n-1));
        end
    end
