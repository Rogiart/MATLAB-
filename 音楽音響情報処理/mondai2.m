delta=1/48000;
t=delta:delta:2;
f=1500;
A=0.9;
y=sin(2*pi*f*t);
y=A*y;
sound(y,48000,16)
plot(t,y)