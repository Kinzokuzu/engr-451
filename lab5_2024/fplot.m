function fplot(b, a)
% FPLOT Z-transform frequency response.
%   FPLOT(B,A,N) is the 256-point complex frequency response
%   of the filter B/A:
%                             -1                -nb
%      jw  B(z)   b(1) + b(2)z + .... + b(nb+1)z
%   H(e) = ---- = ---------------------------------
%                             -1                -na
%          A(z)   a(1) + a(2)z + .... + a(na+1)z
%
% Numerator and denominator coefficients are given in vectors B and A. The
% frequency response is evaluated at 256 points equally spaced around the
% upper half of the unit circle (i.e. –pi<w<=pi)
% If A isn't specified, it defaults to [1].

    if length(b) == 1
        b = [b 0];
    if length(a) == 1
        a = [a 0];
    end

    N = 512;                   % number of points to graph
    n = linspace(0,1,N/2);     % this is the x axis for the plot
    Hz = fft(b, N) ./ fft(a,N);

   
    % this part plots the magnitude subplot
    subplot(2,1,1);
    plot(n, abs(Hz(1:N/2)));
    xlim([0 1]);
    ylim([0 max(abs(Hz(1:N/2)))]);
    ylabel('|H(\omega)|');
    set(gca, 'XTick', []);

    % this part plots the phase subplot
    subplot(2,1,2);
    x = round(Hz(1:N/2), 5);
    phase = round(angle(x)/pi,4); % this rounding fixes the phase jumping issue
    plot(n, phase);
    hold on;
    plot([0 1], [0 0], 'black')
    hold off;
    xlim([0 1]);
    ylim([-1,1]);
    ylabel('< H(\omega) (fractions of \pi)');
    xlabel('\omega (fractions of \pi)');

end
