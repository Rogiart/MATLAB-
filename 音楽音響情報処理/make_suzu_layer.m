function y = make_suzu_layer(src, fs)
y = zeros(size(src));
step = round(1.5*fs);
p = step;

while p < length(src)
    dur = round(0.15*fs);
    idx = p:min(p+dur-1,length(src));
    env = exp(-6*(0:length(idx)-1)'/fs);
    y(idx) = src(idx).*env;
    p = p + step + randi(round(0.5*fs));
end

y = 0.15*y;

% 簡易リバーブ
delay = round(0.03*fs);
rev = zeros(size(y));
rev(delay+1:end) = 0.6*y(1:end-delay);
y = y + rev;
end
