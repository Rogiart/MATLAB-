function y = shamisen_synth(f, t)
env = exp(-6*t);
noise = 0.02*randn(size(t));
y = (sin(2*pi*f*t) + noise) .* env;
end

