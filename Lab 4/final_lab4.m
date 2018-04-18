
%% 2.2
b = [1, -1];
a = [1,0];
N = 100;
[hh,ff] = freqz(b,a,N); 

figure
subplot(1,2,1)
plot(ff,abs(hh))
xlabel('Little Omega')
ylabel('Magnitude')
title('Magnitude Response')
grid on

subplot(1,2,2)
plot(ff,phase(hh))
xlabel('Little Omega')
ylabel('Phase')
title('Phase Response')
grid on

%% Q1(4)
w = linspace(0,pi,100); % omega spacing

Hw = 1- exp(-1j*w); %The transfer function evaluated at z = exp(1j*w)

%let's plot the DTFT
% Very similar output to starter_kit1.m

figure

subplot(1,2,1);
plot(w,abs(Hw));
xlabel('Little Omega');
ylabel('Magnitude');
title('Magnitude Response');
grid on;


subplot(1,2,2);
plot(w,angle(Hw));
xlabel('Little Omega');
ylabel('Phase');
title('Phase Response');
grid on;

%% Q2(3)
w = linspace(-pi,pi,1000)
Hw = 1-2.*exp(-1j*w)+3.*exp(-2j*w)-4.*exp(-3j*w)+4.*exp(-5j*w)-3.*exp(-6j*w)+2.*exp(-7j*w)-exp(-8j*w)
figure

subplot(1,2,1);
plot(w,abs(Hw));
xlabel('Little Omega');
ylabel('Magnitude');
title('Magnitude Response');
grid on;


subplot(1,2,2);
plot(w,angle(Hw));
xlabel('Little Omega');
ylabel('Phase');
title('Phase Response');
grid on;

%% Q2(4)
b = [1,-2,3,-4,0,4,-3,2,-1]
a = [1]
N = 1000
[hh,ff] = freqz(b,a,N) 

figure
subplot(1,2,1)
plot(ff,abs(hh))
xlabel('Little Omega')
ylabel('Magnitude')
title('Magnitude Response')
grid on

subplot(1,2,2)
plot(ff,angle(hh))
xlabel('Little Omega')
ylabel('Phase')
title('Phase Response')
grid on

%% Q3(2)
n = linspace(0,30,31);
h1 = 0.5 / ( exp(1i * pi/2) - 0.5); 
h2 = 0.5 / ( exp(1i * pi/4) - 0.5); 

y1 = 3*cos(pi.*n/2 + angle(h1)) * abs(h1);
y2 = 3*sin(pi.*n/4 + angle(h2)) * abs(h2);
figure
subplot(1,2,1);
plot(y1);
title('hand-calculated y1[n]');
subplot(1,2,2);
plot(y2);
title('hand-calculated y2[n]');

%% Q3(3)
n = linspace(0,30,31);
b = [0, 0.5];
a = [1,-0.5];
x1 = 3*cos(pi.*n/2);
x2 = 3*sin(pi.*n/4);
y1 = filter(b,a,x1);
y2 = filter(b,a,x2);
figure;
subplot(1,2,1);
plot(y1);
axis([0 30 -3 3]);
title('filter function y1[n]');
subplot(1,2,2);
plot(y2);
axis([0 30 -3 3]);
title('filter funtcion y2[n]');

%% Q3(4)
b = [0, 0.5]
a = [1,-0.5]
N = 8
[hh,ff] = freqz(b,a,N) 

figure
subplot(1,2,1)
plot(ff,abs(hh))
xlabel('Little Omega')
ylabel('Magnitude')
title('Magnitude Response')
grid on

subplot(1,2,2)
plot(ff,phase(hh))
xlabel('Little Omega')
ylabel('Phase')
title('Phase Response')
grid on

%% Q4(1)
w=linspace(0,pi,1000)
Hw = 0.2./(1-0.8.*exp(-1j.*w))
figure
subplot(1,2,1)
plot(w,abs(Hw))
xlabel('little Omega')
ylabel('Magnitude')
title('Magnitude Response 0 to pi')

subplot(1,2,2)
plot(w,angle(Hw))
xlabel('little Omega')
ylabel('Phase')
title('Phase Response 0 to pi')

%% Q4(1b)
w=linspace(0,pi/5,1000)
Hw = 0.2./(1-0.8.*exp(-1j.*w))
figure
subplot(1,2,1)
plot(w,abs(Hw))
xlabel('little Omega')
ylabel('Magnitude')
title('Magnitude Response 0 to pi/5')

subplot(1,2,2)
plot(w,angle(Hw))
xlabel('little Omega')
ylabel('Phase')
title('Phase Response 0 to pi/5')
%% Q4(2)
n=linspace(0,1000,1000)
x=cos(n.^2*pi/10000)
figure
plot(x)
title('x[n] for the first 10s')
%% Q4(3)
n=linspace(0,1000,1000)
x=cos(n.^2*pi/10000)
b=[0.2]
a=[1,-0.8]
y=filter(b,a,x)
figure
plot(y)
hold on
w=linspace(0,pi/5,1000)
Hw = 0.2./(1-0.8.*exp(-1j.*w))
plot(abs(Hw))
title('filter() to the input of x[n]')
hold off

%% Q5(1)
t=0:1/8192:1
x=sin(6000*pi.*t+0.5*2000.*t.^2)
figure
plot(t,x)
title('chirp');
sound(x)

%% Q5(4)
t=0:1/8192:10.44
x=sin(6000*pi.*t+0.5*2000.*t.^2)
figure
plot(t,x)
title('aliasing effects at 10.44s')

sound(x)





















