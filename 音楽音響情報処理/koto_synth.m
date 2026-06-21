function y = koto_synth(f, t)
env = exp(-4*t);
y = sin(2*pi*f*t) .* env ...
  + 0.3*sin(2*pi*2*f*t).*env;
end
