%% 1a
b = [2,0,5,4,0,0,-3];
a = [1];
S = tf(b,a);
N = 20;

figure;
subplot(121);
pzplot(S);
subplot(122);
impz(b,a,N);
%% 1b
b = [3,2,0,-2];
a = [1];
S = tf(b,a);
N = 20;

figure;
subplot(121);
pzplot(S);
subplot(122);
impz(b,a,N);
%% 1c
b = [0,0,0,1,0,0,1,-2];
a = [12,1,0,4];
S = tf(b,a);
N = 20;

figure;
subplot(121);
pzplot(S);
subplot(122);
impz(b,a,N);
%% 1d
b = [0,1];
a = [1,exp(-1i*8*pi/10)+exp(1i*8*pi/10),1];
S = tf(b,a);
N = 35;

figure;
subplot(121);
pzplot(S);
subplot(122);
impz(b,a,N);
%% 1d2
n = (0:1:200);
unbounded = exp(i*8*pi/10.*n).*(-1).^n;
output = filter(b,a,unbounded);
figure;
plot(real(output));
%% 1d3
n = (0:1:200);
unbounded = exp(i*8*pi/10.*n).*(0.05).^n;
output = filter(b,a,unbounded);
figure;
plot(real(output));
%% 2a
b = [2,-1/6,0];
a = [1,-1/6,-1/6];
S = tf(b,a);
impulse = ones(1,101);
for i=linspace(2,101,100)
    impulse(1,i) = 0;
end
F = filter(b,a,impulse);
figure;
stem(F);
title('Directly plugging in n','fontsize',14);
xlabel('n(samples)', 'fontsize',14);
ylabel('value','fontsize',14);
%% 2b
F = zeros(1,102);
for i = 3:102
    F(1,i) = 1/6*F(1,i-1) + 1/6*F(1,i-2) + 2*impulse(1,i-2) - 1/6*impulse(i-1);
end
figure;
stem(F(3:102));
title('From filter function','fontsize',14);
xlabel('n(samples)', 'fontsize',14);
ylabel('value','fontsize',14);
%% 3b
unitstep = ones(1,30);
unitstep(1,1) = 0;
n = linspace(0,19,20);
h = zeros(1,20);
for i = 0:19
    h(1,i+1) = 2*((1/3)^i*unitstep(1,2)-(1/3)^(i-1)*unitstep(1,i+1));
end
figure;
stem(h);
title('h impulse response','fontsize',14);
xlabel('n(samples)', 'fontsize',14);
ylabel('value','fontsize',14);
%% 3c
x = zeros(1,20);
for i = 0:19
    x(1,i+1) = (1/2)^i;
end
figure;
stem(conv(x,h));
title('Convolution of x and h','fontsize',14);
xlabel('n(samples)', 'fontsize',14);
ylabel('value','fontsize',14);
%% 4
b = [1,0,0,0,0,0,0,0,0,0,-1/1024];
a = [1,-1/2,0,0,0,0,0,0,0,0,0];
S = tf(b,a);
N = 30;

figure;
pzplot(S);
title('poles and zeros plot for S','fontsize',14);
figure;
impz(b,a,N);
title('impulse response h for N = 30','fontsize',14);
xlabel('n(samples)', 'fontsize',14);
ylabel('value','fontsize',14);
%% 5a
y = zeros(1,52);
x = zeros(1,51);
for i = 0:49
    x(1,i+2) = 0.7^i; 
end
for i = 0:49
    y(1,i+3) = x(1,i+2) - x(1,i+1) + 0.81*y(1,i+1);
end
figure;
stem(y(3:52));
title('Recursive','fontsize',14);
xlabel('n(samples)', 'fontsize',14);
ylabel('value','fontsize',14);
%% 5b 
b = [1,-1,0];
a = [1,0,-0.81];
S = tf(b,a);
F = filter(b,a,x);
figure;
stem(F(2:51));
title('Using filter function','fontsize',14);
xlabel('n(samples)', 'fontsize',14);
ylabel('value','fontsize',14);