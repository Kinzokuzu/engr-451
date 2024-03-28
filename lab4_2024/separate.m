function [sr, sc] = separate(s, fs)
    % SEPARATE Separates row and column tone for a DTMF tones
    %           [sr, sc] = separate(s, fs)
    %           produces row and column sound files sr and sc
    %           for a sound file, s, of DTMF tones that have been
    %           digitized at sample rate, fs.

    %% Part 1 Make filters
    %  Create lowpass FIR Kaiser filter of appropriate order using
    %  your kaiserparams and kaiserfilt functions
    colFreq = 1209;
    rowFreq = 941;

    deltaOmega = 2 * (colFreq - rowFreq) / fs;

    [N, beta] = kaiserparams(deltaOmega, 0.01);

    lowPassFilt = kaiserfilt(N, 0.25, beta);

    %  Create highpass FIR Kaiser filter of appropriate order
    highPassFilt = rectfilt(N, 1) - kaiserfilt(N, 0.26, beta);

    %  Perform filtering
    sr = conv(s, lowPassFilt);
    sc = conv(s, highPassFilt);
end
