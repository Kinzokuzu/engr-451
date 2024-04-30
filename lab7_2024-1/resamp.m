function y = resamp(x, r)
% RESAMP Resample an input sequence x by a factor of r
%        to produce an output sequence y by a combination
%        of upsampling and downsampling.
%        For example,
%        y=resamp(x,1.5);
%        will upsample x by 3 and downsample by 2.

    [up_rate, down_rate] = rat(r); % Find rational approximation

    y = zeros(1, length(x) * up_rate); % Pre-allocate output array
    y(1:up_rate:end) = x; % Upsample by inserting zeros

    % Design lowpass kaiser filter
    wc = 1/max(up_rate, down_rate); % Set cutoff frequency
    fn = wc/pi; % Normalized frequency
    N = round(1+20/fn); % Filter length and order increases as fn decreases
    h = fir1(N-1, wc/pi, kaiser(N, 5));

    y = filter(h, 1, y); % Filter the upsampled sequence
