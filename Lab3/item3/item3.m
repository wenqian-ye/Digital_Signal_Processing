
clear;
syms n z;
x(n) = ((1/2)^n + (1/3)^n)*heaviside(n);
xz1 = ztrans(x,n,z);

% xz1 =
%
% 1/(2*z - 1) + 1/(3*z - 1)
% Let's the impluse response h[n] = u[n];
% yz = xz1*hz = (1/(2*z - 1) + 1/(3*z - 1))*(1/(1-z^-1))
% b = [6 0 -1];
% a = [6 -5 1];
iztrans((1/(2*z - 1) + 1/(3*z - 1) + 1)*(1/(1-z^-1)));
%ans =
 
%3/2 - (1/3)^n/2 - (1/2)^n)
b = [1 0];
a = [1 -1];
n = 1:100;
x = (1/2).^n + (1/3).^n;

xz1 = 3/2 - (1/3).^n/2 - (1/2).^n;
xz2 = filter(b,a,x);
figure(1)
subplot(121);
stem(xz1,'r');
title('Inverse ztrans','fontsize', 14);
xlabel('n','fontsize',14)
ylabel('value','fontsize',14)
subplot(122);
stem(xz2,'b');
title('filter','fontsize', 14);
xlabel('n','fontsize',14)
ylabel('value','fontsize',14)




