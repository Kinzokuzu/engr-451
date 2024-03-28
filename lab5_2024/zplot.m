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

    max_len = max(length(b), length(a));

    if length(b) < max_len
        b = [b, zeros(1, max_len - length(b))];
    elseif length(a) < max_len
        a = [a, zeros(1, max_len - length(a))];
    end

    z = roots(b); % zeros
    p = roots(a); % poles

    % plot zeros
    scatter(real(z), imag(z), 'o', 'blue');
    % plot poles
    scatter(real(p), imag(p), 'x', 'red');
end
