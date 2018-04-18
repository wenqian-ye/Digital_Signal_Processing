%% Report Item 1
n20 = -20 : 20;
n40 = -40 : 40;
wc = pi/4;
%% Report Item 1: Graph for LPF (N = 20)
figure;
N = 41;
w = fftshift((0:(N-1))/N*2*pi);
w(1:N/2) = w(1:N/2) - 2*pi;

lowpass = (wc/pi) * sinc((wc/pi) * n20);
subplot(2,1,1);
stem(n20, lowpass);
title('LPF Impulse Response N = 20');
subplot(2,1,2);
plot(w, abs(fftshift((fft(lowpass)))));
title('LPF Magnitude Response N = 20');

% Graph for LPF (N = 40)
figure;
N = 81;
w = fftshift((0:(N-1))/N*2*pi);
w(1:N/2) = w(1:N/2) - 2*pi;
lowpass = (wc/pi) * sinc((wc/pi) * n40);
subplot(2,1,1);
stem(n40, lowpass);
title('LPF Impulse Response N = 40');
subplot(2,1,2);
plot(w, abs(fftshift((fft(lowpass)))));
title('LPF Magnitude Response N = 40');
%% Report Item 1: Graph for HPF (N = 20)
figure;
N = 41;
w = fftshift((0:(N-1))/N*2*pi);
w(1:N/2) = w(1:N/2) - 2*pi;
delta20 = zeros(1,41);
delta20(1,21) = 1;
highpass = delta20 - (wc/pi) * sinc((wc/pi) * n20);
subplot(2,1,1);
stem(n20, highpass);
title('HPF Impulse Response N = 20');
subplot(2,1,2);
plot(w, abs(fftshift((fft(highpass)))));
title('HPF Magnitude Response N = 20');

% Graph for HPF (N = 40)
figure;
N = 81;
w = fftshift((0:(N-1))/N*2*pi);
w(1:N/2) = w(1:N/2) - 2*pi;
delta40 = zeros(1,81);
delta40(1,41) = 1;
highpass = delta40 -(wc/pi) * sinc((wc/pi) * n40);
subplot(2,1,1);
stem(n40, highpass);
title('HPF Impulse Response N = 40');
subplot(2,1,2);
plot(w, abs(fftshift((fft(highpass)))));
title('HPF Magnitude Response N = 40');
%% Report Item 1: Graph for BPF (N = 20)
figure;
N = 41;
w = fftshift((0:(N-1))/N*2*pi);
w(1:N/2) = w(1:N/2) - 2*pi;
w0 = pi/2;
bandpass = cos(w0 * n20) * (wc/pi) .* sinc((wc/pi) * n20);
subplot(2,1,1);
stem(n20, bandpass);
title('BPF Impulse Response N = 20');
subplot(2,1,2);
plot(w, abs(fftshift((fft(bandpass)))));
title('BPF Magnitude Response N = 20');

% Graph for BPF (N = 40)
figure;
N = 81;
w = fftshift((0:(N-1))/N*2*pi);
w(1:N/2) = w(1:N/2) - 2*pi;
bandpass = cos(w0 * n40) * (wc/pi) .* sinc((wc/pi) * n40);
subplot(2,1,1);
stem(n40, bandpass);
title('BPF Impulse Response N = 40');
subplot(2,1,2);
plot(w, abs(fftshift((fft(bandpass)))));
title('BPF Magnitude Response N = 40');
%% Report Item 2
clc;
close all;
load impulseresponse.mat;
report item 
figure;
stem(h);
title('Impulse Response');
xlabel('hz');
ylabel('magnitude');

hh = transpose(h);
hh = [hh, zeros(1, 512-74)];
h = transpose(hh);

figure;
subplot(2,1,1);
N = length(h);
w = fftshift((0:(N-1))/N*2*pi);
w(1:N/2) = w(1:N/2) - 2*pi;
plot(w, mag2db(abs(fftshift((fft(h))))));
title('Magnitude Response in DB');
subplot(2,1,2);
plot(w, angle(fftshift((fft(h)))));
title('Phase Response');
%% Report Item 3
clc;
close all;
N = 25;
M = (N-1)/2;
wc = pi/3;

w = fftshift((0:(N-1))/N*2*pi);
w(1:(N-1)/2) = w(1:(N-1)/2) - 2*pi;

D = rectangularPulse(-wc, wc, w);

G = D.*exp((-1).*1i.*M.*w);

g=ifft(ifftshift(G)); 
w1=hamming(N); 
w2=w1';

h=w2.*g;
x = h;
[h,n]=freqz(h,25); 

figure;
stem(real(g));
title('Impulse Response');

figure;
plot(n, mag2db(abs(h)));
title('Magnitude Response in DB');

figure;
plot(n,angle(h)); 
title('Phase Response'); 
%% Report Item 4
wc = 0.36 * pi;
wb = 0.3 * pi;
f = [wb, wc];
a = [1,0];
rp = [0.01, 0.0032];
fs = 6.47;
[n,fo,mo,w] = firpmord(f,a,rp,fs);
b = firpm(n,fo,mo,w);
figure;
freqz(b,1);
figure;
impz(b, 1);
%% Report Item 5
close all;
clc;
sound1 = wavread('sound1.wav');
N=length(sound1);
window=hamming(4096);
S=fft(sound1);
S=fftshift(S);
w=fftshift((0:N-1)/N*2*pi);
w(1:N/2)=w(1:N/2)-2*pi;
figure;
plot(w,abs(S));
title('Before Magnitude of Response');
figure;
[s,w,t]=spectrogram(sound1,window,2048,4096);
imagesc(t,w,log(abs(s)));
title('Before Spectrogram');
f=[1.2, 1.5];
a=[1,0];
rp=2;
rs=50;
fs=2*pi;
dev = [(10^(rp/20)-1)/(10^(rp/20)+1)  10^(-rs/20)];
[n,fo,ao,w] = firpmord(f,a,dev,fs);
b = firpm(n,fo,ao,w);
after=filter(b,1,sound1);
N=length(after);
S1=fft(after);
S1=fftshift(S1);
w=fftshift((0:N-1)/N*2*pi);
w(1:N/2)=w(1:N/2)-2*pi;
figure;
plot(w,abs(S1));
title('After filtered Magnitude of Response');
figure;
[s,w,t]=spectrogram(after,window,2048,4096);
imagesc(t,w,log(abs(s)));
title('After Spectrogram');

%% Report Item 6
close all;
clc;
sound2 = wavread('sound2.wav');
N = length(sound2);
window = hamming(4096);

S2=fft(sound2);
S2=fftshift(S2);
w=fftshift((0:N-1)/N*2*pi);
w(1:N/2)=w(1:N/2)-2*pi;
figure;
plot(w,abs(S2));
title('Before Magnitude of Response');

figure;
[s,w,t]=spectrogram(sound2,window,2048,4096);
imagesc(t,w,log(abs(s)));
title('Before Spectrogram');

f=[0.05, 0.1]
a=[1,0]
rp=2
rs=50
fs=2*pi

dev = [(10^(rp/20)-1)/(10^(rp/20)+1)  10^(-rs/20)]
[n,fo,ao,w] = firpmord(f,a,dev,fs);
b = firpm(n,fo,ao,w);

new2=filter(b,1,sound2)

N=length(new2)
figure
[s,w,t]=spectrogram(new2,window,2048,4096)
imagesc(t,w,log(abs(s)))
title('spectrogram of filtered signal')

SS=fft(new2)
SS=fftshift(SS)
w=fftshift((0:N-1)/N*2*pi)
w(1:N/2)=w(1:N/2)-2*pi
figure
plot(w,abs(SS))
title('magnitude response of filtered signal')
%% Report Item 7
clc;
close all;
load sig1.mat;
n = [50, 100, 500, 1000, 10000];
M = 24;

fft_time = [1,2,3,4,5];
matrix_time = [1,2,3,4,5];
for i = 1:length(n)
  N = n(i);
  x = sig1(1:N);
  h = (1./M).*ones(1,M);
  load impulseresponse.mat;
  
  xz = [x, zeros(1, M-1)];
  hz = [h, zeros(1, N-1)];
  
  tic;
  y = ifft(fft(xz) .* fft(hz));
  finish = toc;
  fft_time = [fft_time, finish];
  disp(finish);
  tic;
  conv_mat = zeros(N+M-1, N);
  load impulseresponse.mat;
  x = transpose(x);
  
  for j = N+M-1
    for k = 1:N
       conv_mat(j,k) = hz(mod(j-k, N+M-1)+1);
    end
  end
  
  y2 = conv_mat * x;
  finish = toc;
  matrix_time = [matrix_time, finish];
end

fft_time = fft_time(6:10);
matrix_time = matrix_time(6:10);