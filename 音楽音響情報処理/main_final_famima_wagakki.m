clear; clc;
fs = 48000;

[A,~] = audioread("A.wav");
[B,~] = audioread("B.wav");
A = mean(A,2); B = mean(B,2);
len = min(length(A),length(B));
A = A(1:len); B = B(1:len);

B_mid  = bandpass(B,[200 4000],fs);
B_low  = lowpass(B,400,fs);
B_high = highpass(B,5000,fs);

loop1 = 0.6*A;

fade = linspace(0,1,len)';
loop2 = 0.75*(A + 0.6*fade.*B_mid);

tsu = make_tsuzumi_layer(B_low,fs);
suz = make_suzu_layer(B_high,fs);
loop3 = 0.9*(loop2 + 0.3*tsu + 0.2*suz);

loop4 = loop3 + 0.1*suz;

z = [loop1;loop2;loop3;loop4];
z = z.*linspace(0.7,1,length(z))';
z = highpass(z,80,fs);
z = lowpass(z,9000,fs);
z = 0.9*z/max(abs(z));

fade_len = round(1.5*fs);
z(end-fade_len+1:end) = z(end-fade_len+1:end).*linspace(1,0,fade_len)';

audiowrite("famima_wagakki_FINAL.wav",z,fs);
sound(z,fs);
