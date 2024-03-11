function h = rectfilt(N, wc)
% RECTFILT Creates rectangular filter.
%     h = rectfilt(N, wc)
%     returns filter of order N and cutoff wc
%     based on rectangular window.  wc is in fractions of pi.

    h = ones(1, (2*wc)+1)
    r = length(h) - N;

end
