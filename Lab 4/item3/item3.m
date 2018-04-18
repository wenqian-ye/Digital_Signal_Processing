n = linspace(0,30,31);
x1 = 3*cos(pi*n/2);
x2 = 3*sin(pi*n/4);
y11 = 1.3416*cos(pi*n/2-0.6475*pi);
y21 = 2.0358*cos(pi*n/4-0.409*pi);
b = [0.5 0];
a = [1 -0.5];
% Hw = 0.5*exp(-1j*w)/(1-0.5*exp(-1j*w));
figure(1);
subplot(211);
plot(y11);
subplot(212);
plot(y21);

y21 = filter(b,a,x1);
y22 = filter(b,a,x2);
figure(2);
subplot(211);
plot(y21);
subplot(212);
plot(y22);

N=linspace(0,pi,9);
figure(3);
[h, w]= freqz(b,a,9);

subplot(121)
plot(w,abs(h));
subplot(122)
plot(w,angle(h));

