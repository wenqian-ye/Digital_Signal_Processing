x = ones(1,50);
y= ones(1,100);
z=conv(x,y);
X=0;
Y=0;
Z=0;
for n=1:50
    X=X+x(n);
end
for n=1:100
    Y=Y+y(n);
end
for n=1:149
    Z=Z+z(n);
end
isSame = X+Y==Z;
%It's the same.
clear;
x=sin(2*pi*0.01*(0:100)) + 0.05*randn(1,101);
h=ones(1,5);
y=conv(x,h);
figure(1);
hold;
stem(x);
stem(y);
%Ay=AxAh
clear;
x=sin(2*pi*0.01*(0:100)) + 0.05*randn(1,101);
h=ones(1,5)/5;
y=conv(x,h);
figure(2);
hold;
stem(x);
stem(y);
%Ay=Ax

%Because Ah=1; so in part c, Ay=Ax which statisfies the statement. For part
%b, the figure is 5 times higher than the oringinal on.

