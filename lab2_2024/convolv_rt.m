function y = convolv_rt(x, h)
    lh = length(h);
    hbuf = h(:)'; % make h a row vector
    x = [x(:); zeros(lh-1, 1)]; % pad x with zeros
    y = zeros(1, length(x)); % preallocate output array
    xbuf = zeros(lh, 1); % initialize input array as column vector
    for i = 1:length(x) % for each new value of x[n]
        % put x(i) into the buffer in reverse order
        xbuf(end - mod(i, lh))  = x(i);
        % set up the indexing into the hbuf and/or xbuf arrays here
        y(i) = hbuf * [xbuf(end - mod(i, lh):end); xbuf(1:end - mod(i, lh) -1)]; % store output value
    end
end
