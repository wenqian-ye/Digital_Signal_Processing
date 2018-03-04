%% Plotting the DTFT by hand, an alternative approach


% Suppose we have the system 1/(1-.2z^-1) from 0.5^n u[n]
% Let's say z = exp(1j*w)


w = linspace(0,pi,100); % omega spacing

Hw = 1./(1-.2*exp(-1j*w)); %The transfer function evaluated at z = exp(1j*w)

%let's plot the DTFT
% Very similar output to starter_kit1.m

figure(2);

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