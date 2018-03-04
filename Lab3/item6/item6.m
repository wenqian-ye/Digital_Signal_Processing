clear;
y1 = zeros(1,52);
x = zeros(1,51);
for i = 0:49
   x(1,i+2) = 0.7^i; 
end
for i = 0:49
    y1(1,i+3) = x(1,i+2)-x(1,i+1)+0.81*y1(1,i+1);
end
figure;
hold;
subplot(121)
stem(y1(3:52),'r');
title('Recursive','fontsize', 14);
xlabel('n','fontsize',14)
ylabel('value','fontsize',14)

b1 = [1 0 -0.81];
a1 = [1 -1];
y2 = filter(a1,b1,x);
 for n = 1:50
   y2(n) = y2(n+1);
 end
 subplot(122)
stem(y2(1:50),'b');
title('Filter','fontsize', 14);
xlabel('n','fontsize',14)
ylabel('value','fontsize',14)
