% h[n] = 1, -2, 3, -4, 0, 4, -3, 2, -1.
h = [1 -2 3 -4 0 4 -3 2 -1];
w = linspace(-pi,pi,1000);
z = exp(1j*w);
Hw = 1-2*z.^(-1) +3*z.^(-2)-4*z.^(-3)+4*z.^(-5)-3*z.^(-6)+2*z.^(-7)-z.^(-8);
% using DTFT plot
figure(1);
subplot(1,2,1);
plot(w,abs(Hw));
xlabel('Little Omega');
ylabel('Magnitude');
title('Magnitude Response');
grid on;
subplot(1,2,2);
plot(w,phase(Hw));
xlabel('Little Omega');
ylabel('Phase');
title('Phase Response');
grid on;


% using freqz function
b = [1 -2 3 -4 0 4 -3 2 -1];
a = [1 0];
N = 1000;
[hh,ff] = freqz(b,a,N);
figure(2);
subplot(1,2,1);
plot(ff,abs(hh));
xlabel('Little Omega');
ylabel('Magnitude');
title('Magnitude Response');
grid on;
subplot(1,2,2);
plot(ff,phase(hh));
xlabel('Little Omega');
ylabel('Phase');
title('Phase Response');
grid on;

