[x, fs] = audioread('persevere_bad.wav');

% chunck data into frames
frames = [];
for i = 1:length(x)/fs
    l_bound = (i-1)*fs + 1;
    r_bound = i*fs;
    frames = [frames; x(l_bound:r_bound)'];
end

% get fft of each frame
fft_frames = [];
for i = 1:size(frames, 1)
    fft_frames = [fft_frames; fft(frames(i, :))];
end

% only keep the first half of the fft
fft_frames = fft_frames(:, 1:length(fft_frames(1, :))/2);

% find average fft
avg_fft = mean(abs(fft_frames).^2);

% plot the average fft
% figure;
% plot(avg_fft(500:2000));

[mag, freq]= max(abs(avg_fft(500:2000)));
freq = freq + 500;

% need to redo this on our own
BW = 50;

notch_filter = designfilt('bandstopiir','FilterOrder',2, ...
    'HalfPowerFrequency1',freq-BW,'HalfPowerFrequency2',freq+BW, ...
    'DesignMethod','butter','SampleRate',fs);

y = filter(notch_filter, x);
