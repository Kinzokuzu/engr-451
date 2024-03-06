function y = mag_phase(x)
    y.mag = sqrt(x.real.^2 + x.imag.^2);
    y.phase = atan2(x.imag, x.real);
