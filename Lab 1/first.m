clear;
a=0.00001;
b=5;
N=100;
x=linspace(a,b,N);
y = (x.^2).*sin(x).*log(x);
plot(x,y);
xlabel('x','fontsize',14);
ylabel('y','fontsize',14);
title('Lab1.f1','fontsize',14);
