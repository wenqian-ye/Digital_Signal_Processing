%% Obtain a lowpass filter
[b, a] = butter(2, 0.3)
p = roots(a);  % Poles are roots of denominator A(z)
abs(p)  % Check poles are inside unit circle => stable system
zplane(b, a);  % Or use the zero-pole plot

%% Compute the frequency response
w = linspace(-pi, pi, 100);  % Frequency points between -pi to pi
z = exp(j*w);  % z on unit circle

H = (b(1) + b(2) * z.^(-1) + b(3) * z.^(-2)) ./ ...
    (a(1) + a(2) * z.^(-1) + a(3) * z.^(-2));

figure(1)
subplot(2,1,1), plot(w / pi, abs(H)), 
title('|H_d(\omega)|'), xlabel('\omega / \pi')
subplot(2,1,2), plot(w / pi, angle(H)), 
title('\angle H_d(\omega)'), xlabel('\omega / \pi')

%% Alternatively, use the MATLAB function freqz
[Hf, wf] = freqz(b, a, 100);
figure(2)
subplot(2,1,1), plot(wf / pi, abs(Hf)), 
title('|H_d(\omega)|'), xlabel('\omega / \pi')
subplot(2,1,2), plot(wf / pi, angle(Hf)), 
title('\angle H_d(\omega)'), xlabel('\omega / \pi')

%% Test signal 1
n = 1:30;
k1 = 60;
x1 = cos(w(k1)*n);
y1 = filter(b, a, x1);
figure(3), clf
stem(x1, 'b'), hold on, stem(y1, 'r'), 
title(sprintf('w = %.2f\\pi:  |H_d(w)| = %.2f, \\angle H_d(w)/w = %.2f',...
    w(k1)/pi, abs(H(k1)), angle(H(k1))/w(k1)))

%% Test signal 2
k2 = 75;
x2 = cos(w(k2)*n);
y2 = filter(b, a, x2);
figure(4), clf
stem(x2, 'b'), hold on, stem(y2, 'r'), 
title(sprintf('w = %.2f\\pi:  |H_d(w)| = %.2f, \\angle H_d(w)/w = %.2f',...
    w(k2)/pi, abs(H(k2)), angle(H(k2))/w(k2)))

%% Real signal
load handel
x = y; clear y
sound(x, Fs)

%% Apply filter
y = filter(b, a, x);
sound(y, Fs)

%% Listen to the two test sinusoidals
n = 1:10000;
x1 = cos(w(k1)*n);
sound(x1, Fs)

%%
x2 = cos(w(k2)*n);
sound(x2, Fs)

%% Try another test signal
load chirp
x = y; clear y
sound(x, Fs)

%% And apply the same filter
y = filter(b, a, x);
sound(y, Fs)