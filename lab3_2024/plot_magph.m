function y = plot_magph(x, w)
    y = mag_phase(dtft2(x, w));

    tiledlayout(2,1);

    nexttile
    plot(w ./ pi, y.mag);
    ylabel('|X(\omega)|');

    nexttile
    plot(w ./ pi, y.phase);
    ylabel('\angleX(\omega)');
    xlabel('\omega(rad/\pi)');
