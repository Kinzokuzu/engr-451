function str = dtmfdecode(s, fs)
% DTMFDECODE Decode DTMF tones
%            str = decodedtmf(s, fs)
%            Accepts a array, s, which corresponds to the DTMF tones
%            sampled at fs.
%            Produces a string transcript that decodes the tones.

    % chunck the signal into 10ms windows
    wl = fs / 100;
    windows = [];
    for i = 1:length(s)/wl
        l_bound = (i-1)*wl + 1;
        r_bound = i*wl;
        windows = [windows; s(l_bound:r_bound)'];
    end

    % calculate energy of each window
    energies = floor(sum(windows.^2, 2));
    max_energy = max(energies);

    % if the energy of a window is less than 10 of the max energy, discard it
    tones = [];
    temp = [];
    for i = 1:length(energies)
        if energies(i) > max_energy - 10
            % append to temp to make a tone
            temp = [temp, windows(i, :)];
        elseif length(temp) > 0
            tones = [tones; temp];
            temp = [];
        end
    end
    tones = [tones; temp];

    dtmf = ['1' '2' '3';...
            '4' '5' '6';...
            '7' '8' '9';...
            '*' '0' '#'];

    row_freqs = [697, 770, 852, 941];
    col_freqs = [1209, 1336, 1477];

    % convert to indices
    tone_length = length(tones(1, :));
    row_freqs = round(row_freqs * tone_length / fs) + 1;
    col_freqs = round(col_freqs * tone_length / fs) + 1;

    % build string
    str = '';
    for i = 1:length(tones(:, 1))
        % get magnitudes of the fft
        curr_tone = abs(fft(tones(i,:)));
        % find the row and column frequencies
        [val, row] = max(curr_tone(row_freqs));
        [val, col] = max(curr_tone(col_freqs));

        str = [str, dtmf(row, col)];
    end
end
