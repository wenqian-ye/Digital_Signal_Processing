%% DFT
% Report item 1
% Implement a function called myMatrixDFT that implements the
% DFT using matrix-vector multiplication by constructing the DFT matrix. Validate
% your function with fft. Based on your implementation, why does it make sense that
% the DFT is O(N^2 )?

x = 1:256;
y1 = fft(x);
n = length(x);
y2 = x*myMatrixDFT(n);
norm(y1-y2)

% Comparing myMatrixDFT() with fft() as shown below the difference is 10 -9 hence can almost be
% considered equal

% The DFTMatrix which can be used with implementation of Z requires N 2 iterations i.e.
% N iterations by the column index n and n iterations by the row index k. Therefore the total
% compute time is proportional to O(N^2 ). The DFT requires N^2 multiplications for sine and cosine
% terms each.


%% Using FFT
% Report item 2
% Load signal.mat. A variable called x should appear in your
% workspace. Using fft, find X(ω) and plot its magnitude and phase. Given that
% f s = 200 Hz, find X d (Ω) and plot the magnitude and phase. How many frequency
% tones are there? What are their values (in Hz)?

fs = 200;
load('signal.mat')
X = fftshift(fft(x));
N = length(x);
m=abs(X);
p=angle(X);
w = fftshift((0:N-1)/N*2*pi);
w(1:N/2) = w(1:N/2)-2*pi;
wa=w*fs;
subplot(4,1,1)
plot(w,m)
title('digital frequency axis')
ylabel('Magnitude')
xlabel('w-digital (radians)')
subplot(4,1,2)
plot(w,rad2deg(p))
ylabel('Phase')
xlabel('w-digital (radians)')
subplot(4,1,3)
plot(wa,m)
title('Analog frequency axis')
ylabel('Magnitude')
xlabel('w-analog (radians)')
subplot(4,1,4)
plot(wa,rad2deg(p))
ylabel('Phase')
xlabel('w-analog (radians)')

% From the plot below there are 5 frequency tones
% Their values are are 4.67Hz, 22.67Hz, 32.67Hz, 44.6Hz, 49.34Hz

%% Zero-Padding
% Report Item 3:Load NMRSpec.mat. The sampling frequency of the NMR signal
% is f s = 2000 Hz. Plot the magnitude and phase spectrum of the signal (hint:
% MATLAB’s fft can perform zero-padding). Calculate the 32-point DFT spectrum
% of the first 32 points of the signal. Can you distinguish the peaks corresponding to
% creatine (around 209 Hz) and chlorine (185 Hz)? Zero-pad the signal to 512 points
% and plot the resulting magnitude and phase spectrum. Does zero-padding help?
% Why or why not?

load('NMRSpec.mat')
fs = 2000;
N = length(st);
N1=32;
N2=512;
X = fftshift(fft(st,N));
x1=st(1:32);
X1=fftshift(fft(x1));
Z = zeros(512,1);
Z(1:32)=x1;
fftshift(fft(Z));
Y=fftshift(fft(Z,N));
m=abs(X);
p=angle(X);
m1=abs(X1);
p1=angle(X1);
Zm=abs(Z);
Zp=angle(Z);
w = fftshift((0:N-1)/N*fs);
w(1:N/2) = w(1:N/2)-fs;
w1 = fftshift((0:N1-1)/N1*fs);
w1(1:N1/2) = w1(1:N1/2)-fs;
w2 = fftshift((0:N2-1)/N2*fs);
w2(1:N2/2) = w2(1:N2/2)-fs;
figure(1)
subplot(2,1,1)
plot(w,m)
title('Analog frequency axis')
ylabel('Magnitude')
xlabel('Frequency (Hz)')
subplot(2,1,2)
plot(w,rad2deg(p))
ylabel('Phase')
xlabel('Frequency (Hz)')
figure(2);
subplot(2,1,1)
plot(w1,m1)
title('32-point DFT')
ylabel('Magnitude')
xlabel('Frequency (Hz)')
subplot(2,1,2)
plot(w1,rad2deg(p1))
ylabel('Phase')
xlabel('Frequency (Hz)')
figure(3)
subplot(2,1,1)
plot(w2,Zm)
title('After zeropadding')
ylabel('Magnitude')
xlabel('Frequency (Hz)')

subplot(2,1,2)
plot(w2,rad2deg(Zp))
ylabel('Phase')
xlabel('Frequency (Hz)')

% NO we can not distinguish the peaks corresponding to creatine (around 209 Hz) and chlorine
% (185 Hz) as we can only tell the values of DFT coefficients at the peaks. In-between the peaks
% we are not certain how the the values differ as the spectrum plotted is discrete and maltlab
% simply connects the points between two peaks by straight lines as can be visualized in the
% 32point DFT plot above.
% After zero padding the signal to 512 points more peaks can be identified in the frequency
% spectrum therefore it enables to distinguish between the peaks corresponding to creatine (around
% 209 Hz)(around 7589 in magnitude) and chlorine (185 Hz)(around 5899 in magnitude). Zero
% padding provides a better approximation for the values of peaks in the frequency spectrum as the
% Number of frequency samples are increased.
% 

%% 3.3 correction
load('NMRSpec.mat');
sdft = zeros(512,1);
for k = 1:32
    sdft(k) = st(k);
end
SDFT=fft(sdft);
SDFT = fftshift(SDFT);
w= fftshift((0:512-1)/512*2*pi);
w(1:512/2) = w(1:512/2)-2*pi;
Omega = w*2000;
f = Omega/2/pi;
figure
subplot(2,1,1);
plot(f,abs(SDFT));
title('Magnitude Response of NMR signal');
xlabel('Frequency');
subplot(212);
plot(f,angle(SDFT));
title('Phase Response of NMR signal');

xlabel('Frequency');


%% Truncation and Windowing

% Report Item 4: For N = 20, plot the rectangular window using stem and its mag- nitude response
% (in decibels) zero-padded to 512 points using plot. Use mag2db to convert the magnitude
% response into decibels. Repeat for triangular, hamming, hanning, and Kaiser windows. For the
% Kaiser window, let β = 0.1. How do the mainlobe width and sidelobe height of the rectangular
% window compare to the tri- angular window? Between the rectangular window and hamming
% window, which one has lower side lobes?

N=20;
N1=512;
x=0:19;
X1=zeros(1,512);
w = fftshift((0:N1-1)/N1*2*pi);
w(1:N1/2) = w(1:N1/2)-2*pi;
for n=0:(N-1)
R(n+1)=1;
if (n>=0)&&(n<=N/2)
T(n+1)=2*n/N;
else
T(n+1)=T(N-n);
end
Hm(n+1)=0.54-(0.4*6*cos(2*pi*n/N));
Hn(n+1)=0.5-(0.5*cos(2*pi*n/N));
end
K=kaiser(N,0.1);ZR = zeros(1,512);
ZR(1:N)=R;
YR=fftshift(fft(ZR,N1));
mR=abs(YR);
ZT = zeros(1,512);
ZT(1:N)=T;
YT=fftshift(fft(ZT,N1));
mT=abs(YT);
ZHm = zeros(1,512);
ZHm(1:N)=Hm;
YHm=fftshift(fft(ZHm,N1));
mHm=abs(YHm);
ZHn = zeros(1,512);
ZHn(1:N)=Hn;
YHn=fftshift(fft(ZHn,N1));
mHn=abs(YHn);
ZK = zeros(1,512);
ZK(1:N)=K;
YK=fftshift(fft(ZK,N1));
mK=abs(YK);
figure(1)
subplot(2,1,1)
stem(x,R)
title('Rectangualar window')

subplot(2,1,2)
plot(w,mag2db(mR))
title('Rectangualar window-Magnitude response(db)')
xlabel('w(radians)')
figure(2)
subplot(2,1,1)
stem(x,T)
title('Triangular window')
subplot(2,1,2)
plot(w,mag2db(mT))
title('Triangular window-Magnitude response(db)')
xlabel('w(radians)')
figure(3)
subplot(2,1,1)
stem(x,Hm)
title('Hamming window')
subplot(2,1,2)
plot(w,mag2db(mHm))
title('Hamming window-Magnitude response(db)')
xlabel('w(radians)')
figure(4)
subplot(2,1,1)
stem(x,Hn)
title('Hanning window')
subplot(2,1,2)
plot(w,mag2db(mHn))
title('Hanning window-Magnitude response(db)')
xlabel('w(radians)')
figure(5)
subplot(2,1,1)
stem(x,K)
title('Kaiser window')
subplot(2,1,2)
plot(w,mag2db(mK))
title('Kaiser window-Magnitude response(db)')
xlabel('w(radians)')

% From the below plot it can be inferred that the mainlobe width is wider in triangular
% window(2*0.6627) than in rectangular window (2*0.3191) and the side lobe height is less and
% lower in triangular window(-5.61db) than in rectangular window(12.82db).
% Hamming window has sides lobe height of (15.63 db) and rectangular window has (12.82 db) so
% rectangular window has lower side lobes
%%



% Report Item 5: Using diric, implement the DTFT of a rectangular window of length N = 20.
% Plot the magnitude and phase response (do not convert to decibels). Repeat for N = 40. For each
% case, what is the width of the mainlobe (in radians)? Measure from null-to-null.
% (Refer to lab2_6b.m)



N=20;
N1=40;
w = fftshift((0:N-1)/N*2*pi);
w(1:N/2) = w(1:N/2)-2*pi;
D=diric(w,N).*N.*exp((-1).*1i.*w.*N./2)./exp((-1).*1i.*w./2);
m=abs(D);
p=angle(D);
figure(1)
subplot(2,1,1)
stem(w,m)
title('DTFT of rectangular window for N=20 ')
ylabel('magnitude')
xlabel('frequency(radians)')
subplot(2,1,2)
plot(w,p)
ylabel('Phase')
xlabel('frequency(radians)')
w1 = fftshift((0:N1-1)/N1*2*pi);
w1(1:N1/2) = w1(1:N1/2)-2*pi;
D1=diric(w1,N1).*N1.*exp((-1).*1i.*w1.*N1./2)./exp((-1).*1i.*w1./2);
m1=abs(D1);
p1=angle(D1);
figure(2)
subplot(2,1,1)
stem(w1,m1)
title('DTFT of rectangular window for N=40 ')
ylabel('magnitude')
xlabel('frequency(radians)')
subplot(2,1,2)
stem(w1,p1)
ylabel('Phase')
xlabel('frequency(radians)')

% With of main lobe for N=20 =0.6824 radians
% Width of main lobe for N=40=0.3142 radians



%%


% Report Item 6: Given x(n) = sin(2πf0n∆t) where f0 = 5, ∆t = 0.02, and n = 0, . . . , N − 1. What
% value(s) must N be in order to minimize spectral leakage? Plot the magnitude and phase response
% of x(n) using the minimum value of N.

% To minimize spectral leakage N>f s /f 0 =(1/0.02)/5=10
% N>10

N = 10;
for n=0:(N-1)
A(n+1)=sin(2*pi*0.1*n)
end
X = fftshift(fft(A));
m=abs(X);
p=angle(X);
w = fftshift((0:N-1)/N*2*pi);
w(1:N/2) = w(1:N/2)-2*pi;
wa=w*50;
subplot(2,1,1)
plot(wa,m)
ylabel('Magnitude')
xlabel('w-digital (radians)')
subplot(2,1,2)
plot(wa,rad2deg(p))
ylabel('Phase')


%%

% Report Item 7: Here are the following steps:
% 1.) Load song1.mat. The variable song1 should appear in your workspace
% 2.) Listen to song1 by the sound command. Set Fs to 44100 (second argument of
% sound())
% 3.) Use the spectrogram function with following arguments
% a. x is the song signal (yes, just song1)
% b. window is a Hamming window of size 4096
% c. noverlap is 2048
% d. w is 4096
% 4.) The output is stored in s,w,t. Type in the following command:
% agesc(t,w,log(abs(s)));
% im-
% The output is a matrix, with the y-axis representing digital frequencies between 0
% and pi. The x-axis representing each block. The y-axis and x-axis are the frequency
% and temporal representations of the signal
% 5.) Repeat 1-4, for song2
% 6.) Please turn in a spectrogram for each song. For each spectrogram, comment on
% the frequency distribution as a function of blocks. Can you make out the drums,
% chords, synthesizers from looking at the spectrogram. Does it make sense? NOTE
% : The two genres are French Electronic, and Math Rock.


load('song1.mat')
sound(song1,44100)
w=4096;
window = hamming(4096);
noverlap = 2048;
[s,w,t] = spectrogram(song1,window,noverlap,w);
figure(1)
imagesc(t,w,log(abs(s)));
title('French Electronic');
ylabel('digital frequencies');
xlabel('block');
load('song2.mat')
sound(song2,44100)
w=4096;
window = hamming(4096);
noverlap = 2048;
[s,w,t] = spectrogram(song2,window,noverlap,w);
figure(2)
imagesc(t,w,log(abs(s)));
title('Math Rock')
ylabel('digital frequencies');
xlabel('block');

