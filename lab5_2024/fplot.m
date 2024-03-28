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
end
