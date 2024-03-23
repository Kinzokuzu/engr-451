function lab5_2024
% lab5_2024.m
% You will provide the print-out for the following

% A (non-causal) bandstop filter
figure
pzfplot([1 -1], [1 -1 0.5]);
title('A bandpass filter');

% A rectangular window
figure
pzfplot(ones(1, 10), 1);
title('A rectangular window');

% A notch filter
figure
pzfplot([1 zeros(1, 8) -1], [1 zeros(1, 8), -.5]);
title('A notch filter');

% An unstable band-pass filter
figure
pzfplot(1, [1 -2 2]);
title('An unstable band-pass filter');

% A non-causal oscillating response
figure
pzfplot([0 1 1], [1 .5]);
title('A lowpass filter');

% A delayed decaying response
figure
pzfplot([0 0 1 1], [0 1 -.8]);
title('A delayed decaying response');

