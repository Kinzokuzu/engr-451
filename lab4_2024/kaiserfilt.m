function h = kaiserfilt(N, wc, beta)
    % KAISERFILT Creates FIR Kaiser filter.
    % h = kaiserfilt(N, wc, beta) creates Kaiser filter
    % h of order N, cutoff wc and shape parameter beta.
    % wc is in fractions of pi.

    n = -((N-1)/2):((N-1)/2); % create n values to pass
    w = wc*sinc(wc*n);        % through sinc function

    h = besseli(1, beta .* sqrt(1-(2 .* n / (N-1)).^2)) ./ besseli(1, beta); % kaiser window

    h = h .* w;
    h = sum(h) / h;

end