

b = [0, 1];
a = [1,2*cos(4*pi/5),1];
H = tf(b,a,-1,'Variable','z^-1');
N = 35;
figure(1)
subplot(121)
pzplot(H)
subplot(122)
impz(b,a,N)