function test_lab8_2024
	%
	%  Make sure you download all the test files s1.wav -> s8.wav
	%  Copyright (c) 2024 Thomas Holton
	
	nFiles = 6;
	for i = 1:nFiles
		fileName = ['s' num2str(i)];
		[s, fs] = audioread([fileName '.wav']);
		num = round(32768 * s(end-12:end));
		indx = find(num, 1);
		num = num(indx:end);
		str = char(48 + num);
		
		out = dtmfdecode(s, fs);
		
		fprintf(1, '%s: ', fileName)
		if (~isempty(out))
			if (strcmp(out(:), str(:)))
				fprintf(1, '%s is O.K.\n', out);
			else
				fprintf(1, 'Got %s instead of %s\n', out, str);
			end
		else
			disp('Empty');
		end
	end
end



