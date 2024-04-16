function [b, a] = filtprogram()

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
%plot(avg_fft(500:2000));

[mag, freq]= max(abs(avg_fft(500:2000)));
freq = freq + 500;

% need to redo this on our own
BW = 50;

notch_filter = designfilt('bandstopiir','FilterOrder',2, ...
    'HalfPowerFrequency1',freq-BW,'HalfPowerFrequency2',freq+BW, ...
    'DesignMethod','butter','SampleRate', fs);

[b, a] = tf(notch_filter);
y = filter(b, a, x);

%sketch of pole zero plot that removes the tones 
pos=[-1 -1 2 2];

hold on
grid on
axis equal

rectangle('Position',pos,'Curvature',[1 1])

temp1=length(b)-length(a);
temp2=length(a)-length(b);

%poles
h=[a zeros(1, temp1)];
p=roots(h);

%zeros
g=[b zeros(1, temp2)];
z=roots(g);

plot(real(p),imag(p),'x','MarkerSize',8,'Color','r')
plot(real(z),imag(z),'o','MarkerSize',8,'Color','b')

poleRad = angle(p)
zeroRad = angle(z)

poleDeg = rad2deg(poleRad)
zeroDeg = rad2deg(zeroRad)
end
