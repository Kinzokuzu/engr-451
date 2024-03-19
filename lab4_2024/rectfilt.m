function h = rectfilt(N, wc)
% RECTFILT Creates rectangular filter.
%     h = rectfilt(N, wc)
%     returns filter of order N and cutoff wc
%     based on rectangular window.  wc is in fractions of pi.
    n = -((N-1)/2):((N-1)/2); % create n values to pass
    h = wc*sinc(wc*n);        % through sinc function

    h = h / sum(h); % normalize
end
