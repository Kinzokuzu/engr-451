function h = kaiserfilt(N, wc, beta)
    % KAISERFILT Creates FIR Kaiser filter.
    % h = kaiserfilt(N, wc, beta) creates Kaiser filter
    % h of order N, cutoff wc and shape parameter beta.
    % wc is in fractions of pi.

    n = -((N-1)/2):((N-1)/2); % create n values to pass
    h = wc*sinc(wc*n);        % through sinc function

    w = besseli(0,beta*sqrt(1-(((0:N-1)-(N-1)/2)/((N-1)/2)).^2))/besseli(0,beta);

    % Filtering h[n]*[n]
    h = h .* w;
    h = h / sum(h);

end
