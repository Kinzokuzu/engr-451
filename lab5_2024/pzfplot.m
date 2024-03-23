function pzfplot(b, a)
% PZFPLOT Plot Frequency response and pole-zero plot
%    of the filter H(z), specified by
%                                -1                -nb 
%             B(z)   b(1) + b(2)z + .... + b(nb+1)z
%      H(z) = ---- = ---------------------------------
%                                -1                -na
%             A(z)   a(1) + a(2)z + .... + a(na+1)z
%
%    given numerator and denominator coefficients in vectors B and A.

clf;
b = b(:)';
a = a(:)';
fplot(b, a);

h = get(gcf, 'Children');
subplot(2, 2, 1, h(2))
subplot(2, 2, 3, h(1));
set([subplot(2, 2, 1) subplot(2, 2, 3)], 'XTick', 0:0.25:1)

subplot(2, 2, [2 4])
zplot(b, a);

figure(gcf);

return
