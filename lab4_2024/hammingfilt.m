function h = hammingfilt(N, wc)
% HAMMINGFILT Creates Hamming FIR filter.
%     h = hammingfilt(N, wc)
%     returns filter of order N and cutoff wc
%     based on hamming window.  wc is in fractions of pi.
    n = -((N-1)/2):((N-1)/2); % create n values to pass
    h = wc*sinc(wc*n);        % through sinc function

    w = 0.54 - 0.46*cos(2*pi*(0:N-1)/(N-1)) % hamming windows

    h = w .* h;
    h = h / sum(h); % normalize
end
