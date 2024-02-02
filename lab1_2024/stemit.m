function stemit(x)
% STEMIT Display a Matlab sequence x using a stem plot.
    stem([x.offset:length(x.data) + x.offset - 1], x.data);
