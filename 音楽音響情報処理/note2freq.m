function f = note2freq(note)
% note例: "F#5" または 'F#5'

% --- string → char に統一 ---
note = char(note);

notes = {'C','C#','D','D#','E','F','F#','G','G#','A','A#','B'};

name = note(1:end-1);     % 例: F#
oct  = str2double(note(end));  % 例: 5

idx = find(strcmp(notes, name)) - 1;

midi = idx + (oct + 1)*12;
f = 440 * 2.^((midi-69)/12);
end
