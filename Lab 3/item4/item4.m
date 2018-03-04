
h = zeros(1,20);
h(1,1)=2;
for n =2:20
  h(1,n) = -4*(1/3)^(n-1);
end
figure(1);
subplot(121);
stem(h);
x = zeros(1,20);
for n=1:20
   x(1,n) = (1/2)^(n-2) ;
    
end
y = conv(x,h);
subplot(122);
stem(y);