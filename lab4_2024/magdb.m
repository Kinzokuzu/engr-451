function ph = magdb(h)
% MAGDB  Display magnitutde of Fourier transform of h[n] on a dB scale
%           ph = magdb(h)
    % calculate H using FFT
    N = 1024; % chosen from lab instructions
    H = fft(h, N);

    mag = abs(H);
    w = (0:(N/2-1))/(N/2); % normalized frequency
    mag = mag(1:N/2); % only plot the first half

    mag_db = 20*log10(mag); % convert to dB
    ph = plot(w, mag_db);

end
