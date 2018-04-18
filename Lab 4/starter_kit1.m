%% How to Use freqz()
% A mini-tutorial by BCE


% freqz() is a function that computes the frequency response of some
% transfer function
% It takes in 3 arguments b,a, n

% b is the numerator coefficients in the transfer function -> Decreasing
% order of powers just like the tf function

% a is the denominator coefficients in the transfer function -> Decreasing
% order of powers just like the tf function

% n is the number of evaluation points that you desire between 0 and pi



%% Suppose the Transfer function z/(z-.5)

% Corresponding Coefficients to the transfer function
b = [1, -1];
a = [1, 0];
N=100 % I want 100 points between 0 and pi
[hh,ff] = freqz(b,a,N);

% hh is a vector containing the frequency response for omegas in the ff vector
% ff is a vector containing the frequencies of interest

% hh is a complex valued sequence so we'll plot the magnitude and phase of
% it

figure(1);

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


% Note the plot goes from 0 to pi
% This is much easier than computing plots by, right?




