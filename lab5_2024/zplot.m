function zplot(b, a)
% ZPLOT Plot a zero-pole plot.
%                           -1                -nb
%        B(z)   b(1) + b(2)z + .... + b(nb+1)z
% H(z) = ---- = ---------------------------------
%                           -1                -na
%        A(z)   a(1) + a(2)z + .... + a(na+1)z
%
% zplot(b, a) plots the zeros and poles which determined by vectors b and a
% The plot includes the unit circle and axes for reference, plotted in black.
% Zeros are represented with a blue 'o', each pole with a red 'x'.

% initial unit circle
    rectangle('Position', [-1, -1, 2, 2], 'Curvature', [1, 1]);
    axis equal;
    hold on;

    % if the length of the vectors are not equal, pad the shorter vector with zeros
    max_len = max(length(b), length(a));
    if length(b) < max_len
        b = [b, zeros(1, max_len - length(b))];
    elseif length(a) < max_len
        a = [a, zeros(1, max_len - length(a))];
    end

    z = roots(b); % zeros
    p = roots(a); % poles

    % find the maximum value of the zeros and poles
    max_val = max([max(abs(real(z))), max(abs(imag(z))), max(abs(real(p))), max(abs(imag(p)))]) * 1.1;

    % if the maximum value is less than 1, set it to 1
    if max_val < 1.1
        max_val = 1.1;
    end

    % set the axis limits
    axis([-max_val, max_val, -max_val, max_val]);
    % plot the x & y axes through the origin
    graph = plot([-max_val max_val],[0 0], 'black');
    graph = plot([0 0], [-max_val max_val], 'black');
    
    % plot zeros
    scatter(real(z), imag(z), max_val * 125, 'o', 'blue'); % max_val * 125 in order to scale markers
    % plot poles
    scatter(real(p), imag(p), max_val * 125, 'x', 'red');

    hold off;
end
