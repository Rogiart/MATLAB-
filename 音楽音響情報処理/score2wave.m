function y = score2wave(score, fs, synth)
y = [];

for i = 1:size(score,1)
    note = score{i,1};
    dur  = score{i,2};

    N = round(dur*fs);

    if strcmp(char(note), 'R')
        tone = zeros(N,1);
    else
        f = note2freq(note);
        t = (0:N-1)'/fs;
        tone = synth(f, t);
    end

    y = [y; tone];
end
end

