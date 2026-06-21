function y = make_tsuzumi_layer(src, fs)
y = zeros(size(src));
step = round(0.5*fs);
p = step;

while p < length(src)
    if rand < 0.3
        dur = round(0.08*fs);
        idx = p:min(p+dur-1,length(src));
        env = exp(-25*(0:length(idx)-1)'/fs);
        y(idx) = src(idx).*env;
    end
    p = p + step;
end

y = 0.3*y;
end
