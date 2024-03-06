%% lab4_2024.m
clear
delete(allchild(0));
w = linspace(-pi, pi, 11);
x.data = [1 6 3 -4 2];
x.offset = -1;

%% Problem #1: Even, Odd

test_lab3_2024('even(x)');
test_lab3_2024('odd(x)');
test_lab3_2024('trimit(addit(even(x), odd(x)))');

%% Problem #1: Conjugate
x.data = [1+1j 6j 3 1j-4 2j];
x.offset = -2;
test_lab3_2024('conjit(x)')
test_lab3_2024('addit(x, conjit(x))')
%% Problem #2: DTFT
x.data = [1 1 1];
x.offset = -1;
test_lab3_2024('dtft(x, w)');

% Simple impulse Caution! check your answer for this.
% It should be a sequence.
x.data = 1;
x.offset = 0;
test_lab3_2024('dtft(x, w)');

x.data = [1 3 -1 -4 1];
x.offset = -2;
test_lab3_2024('dtft(x, w)');

x.data = [1+1j 0 1-1j];
x.offset = -1;
test_lab3_2024('dtft(x, w)-dtft(conjit(flipit(x)), w)');

%% Problem #3: Real and Imaginary
x.data = [1 1 1 1 1];
x.offset = -1;
test_lab3_2024('dtft2(x, w)');

x.data = [1 2 2 -1 2 1];
x.offset = -2;
test_lab3_2024('dtft2(x, w)');

%% Problem #4: Magnitude and Phase
test_lab3_2024('mag_phase(dtft2(x, w))');

%% Problem #5 Plotting
w = linspace(-pi, pi, 1001);
plot_magph(x, w);

% This is a purely real and even function.
% What can you say about the phase?
% Specifically why is it either 0 or pi?
x.data = [1 1 1];
x.offset = -1;
set(figure, 'Color', 'w');
plot_magph(x, w);

% This is a purely real and odd function.
% What can you say about the phase?
% Specifically why is it either +pi/2 or -pi/2?
x.data = [-1 0 1];
x.offset = -2;
set(figure, 'Color', 'w');
plot_magph(x, w);

% Here are a series of pulse functions.
% What happens to the magnitude of the transform as the pulse gets broader?
% You may note that the phase 'chatters' between +pi and -pi at some values of w.
% This doesn't look nice and it's confusing. How could you fix this in your plot_magph
% program so that the phase doesn't chatter? No biggie if you can't.
% (Hint: it has something to do with a very small imaginary part...).

x.data = ones(1, 5);
x.offset = -2;
set(figure, 'Color', 'w');
plot_magph(x, w)

x.data = ones(1, 21);
x.offset = -10;
set(figure, 'Color', 'w');
plot_magph(x, w)

x.data = ones(1, 101);
x.offset = -50;
set(figure, 'Color', 'w');
plot_magph(x, w)

%% Print programs
disp(' ')
disp('--- dtft.m --------------------------------')
type('dtft')
disp(' ')
disp('--- dtft2.m -------------------------------')
type('dtft2')
disp(' ')
disp('--- mag_phase.m ---------------------------')
type('mag_phase')
disp(' ')
disp('--- plot_magph.m --------------------------')
type('plot_magph')


