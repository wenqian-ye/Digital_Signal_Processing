%% 1(a)
originalLena = imread('lena.gif');
figure;
imshow(originalLena);
title('Original Lena','fontsize', 14);
%% 1(b)
h = linspace(1/6,1/6,6);
rowLena = myConvRow(originalLena,h);
figure;
imshow(rowLena);
title('Row-conv Lena','fontsize', 14);
%% 1(c)
colLena = myConvCol(originalLena,h);
figure;
imshow(colLena);
title('Col-conv Lena','fontsize', 14);
%% 1(d)
rowColLena = myConvCol(rowLena,h);
figure;
imshow(rowColLena);
title('Row-conv-Col-conv Lena','fontsize', 14);
%% 2(a)
y2a = zeros(1,22);
y2a2= zeros(1,22);
x2a = zeros(1,22);
y2a(1,1) = 1;
y2a2(1,1)= 1;
x2a(1,2) = 1;
for i = 2:length(y2a)
   y2a(1,i) = (i-2)/(i+1) * y2a(1,i-1) + x2a(1,i);
end
for i = 2:length(y2a2)
   y2a2(1,i) = 0.7 * y2a2(1,i-1) + x2a(1,i);
end
figure;
stem(linspace(0,20,21),y2a(1,2:22));
title('y1 delta n','fontsize', 14);
xlabel('n','fontsize',14);
ylabel('y','fontsize',14);
figure;
stem(linspace(0,20,21),y2a2(1,2:22));
title('y2 delta n','fontsize', 14);
xlabel('n','fontsize',14);
ylabel('y2','fontsize',14);
%% 2(b)
y2b = zeros(1,22);
y2b2= zeros(1,22);
x2b = zeros(1,22);
y2b(1,1) = 1;
y2b2(1,1)= 1;
x2b(1,6) = 1;
for i = 2:length(y2b)
   y2b(1,i) = (i-2)/(i+1) * y2b(1,i-1) + x2b(1,i);
end
for i = 2:length(y2b2)
   y2b2(1,i) = 0.7 * y2b2(1,i-1) + x2b(1,i);
end
figure;
stem(linspace(0,20,21),y2b(1,2:22));
title('y1 delta n-4','fontsize', 14);
xlabel('n','fontsize',14);
ylabel('y1','fontsize',14);
figure;
stem(linspace(0,20,21),y2b2(1,2:22));
title('y2 delta n-4','fontsize', 14);
xlabel('n','fontsize',14);
ylabel('y2','fontsize',14);
%% 3(a n=50)
load bitcoin.mat
y3a = zeros(1,length(newcoin));
for i = 50:362
  for j = 0:50
     y3a(1,i+1) = y3a(1,i+1) + 1/51 * newcoin(1,i-j+1);
  end
end
%% 3(a n=25)
y3b = zeros(1,length(newcoin));
for i = 25:(362-25)
  for j = -25:25
     y3b(1,i+1) = y3b(1,i+1) + 1/51 * newcoin(1,i-j+1);
  end
end
%% 3(b)
figure;
plot(newcoin);
hold;
plot(y3a,'color','red');
plot(y3b,'color','blue');
title('Bitoin Analysis', 'fontsize',14);
legend('x','y1','y2');
h4a=zeros(1,51)
for i=1:51
   h4a(i)=1/51;
end
figure;
c=conv(newcoin,h4a);
plot(c);
title('conv function','fontsize',14);
%% 4(a)
ax4=linspace(0,99,100);
figure;
ax41=0.95.^(ax4).*(ax4+1);
plot(ax4,ax41);
title('Closed form','fontsize',14);
%% 4(b)
t=ones(1,50);
x=zeros(1,50);
h=zeros(1,50);
for i = 1:length(t)
x(1,i)=(0.95)^(i-1);
h(1,i)=(0.95)^(i-1);
end
figure;
temp = conv(h,h);
plot(temp);
title('50 samples Finite Length representation of x and h', 'fontsize', 14);
%% 4(c)
figure;
plot(temp(1:99));
title('Using a convolution with 99 samples', 'fontsize',14);
%% 5
y5 = zeros(1,1002);
y5(1,1) = 0;
for i = 2:1002
  y5(1,i) = 5 * y5(1,i-1) + 1; 
end
figure;
plot(y5(2:1002));
title('Stable or unstable','fontsize', 14);
xlabel('n','fontsize',14);
ylabel('y','fontsize',14);
% The system is unstable
%% 6(b)
x6b = sin(2 * pi * 0.01 * (0:100)) + 0.05 * rand(1,101);
h6b = ones(1,5);
y6b = conv(h6b,x6b);
figure;
plot(x6b);
hold;
plot(y6b);
title('Convolution of x and h before normalize k', 'fontsize', 14);
legend('x','y1');
%% 6(c)
h6c = 0.2 .* h6b;
y6c = conv(h6c,x6b);
figure;
plot(x6b);
hold;
plot(y6c);
title('Convolution of x and h after normalize k', 'fontsize', 14);
legend('x','y1');
%% 7(b)
h7b = [1,-2,1];
rowLena7b = myConvRow(originalLena,h7b);
figure;
imshow(rowLena7b);
title('Row-conv Lena','fontsize', 14);
%% 7(c)
colLena7c = myConvCol(originalLena,h7b);
figure;
imshow(colLena7c);
title('Col-conv Lena','fontsize', 14);
