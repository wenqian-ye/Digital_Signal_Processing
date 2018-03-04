x=linspace(0,5,25);
f1 = (x.^2).*(exp(sqrt(x)));
f2 = 3.*sqrt(x)+sin(8.*pi.*x);
subplot(211);
plot(x,f1);
stem(f1);
subplot(212);
plot(x,f2);

stem(f2);