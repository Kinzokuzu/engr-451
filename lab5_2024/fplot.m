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
    end
    if length(a) == 1
        a = [a 0];
    end

    N = 512;
    w = linspace(0, pi, N/2+1);
    H = fft(b, N) ./ fft(a, N);

    subplot(2, 1, 1);
    plot(w ./ pi, abs(H(1:N/2+1)));
    ylabel('|X(\omega)|');

    subplot(2, 1, 2);
    phase = round(angle(H(1:N/2+1))/pi, 4);
    plot(w ./ pi, phase);
    ylabel('\angleX(\omega)');
    xlabel('\omega(rad/\pi)');

    hold on;
    ylim([-1 1]);
    yline(0, '-');
    hold off;

end
