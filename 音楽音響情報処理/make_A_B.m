fs = 48000;

score = {
"F#5",0.4;"D5",0.4;"A4",0.4;"D5",0.4;
"E5",0.4;"A5",0.4;"R",0.5;
"E4",0.5;"E5",0.4;"F#5",0.4;
"E5",0.4;"A4",0.4;"D5",0.4};

% --- A ---
A = score2wave(score, fs, @koto_synth);
A = A + 0.15*score2wave(score, fs, @shamisen_synth);

% 正規化（★重要）
A = 0.9 * A / max(abs(A));

audiowrite("A.wav", A, fs);

% --- B ---
B = score2wave(score, fs, @koto_synth);
B = B + 0.4*score2wave(score, fs, @shamisen_synth);

% 正規化（★重要）
B = 0.9 * B / max(abs(B));

audiowrite("B.wav", B, fs);
