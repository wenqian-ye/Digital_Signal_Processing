
load count.dat
x = count(:,1);
a = [1 0.2];
b = [2 3];
y = filter(b,a,x);

t = 1:length(x);
plot(t,x,'--',t,y,'-')
legend('Original Data','Filtered Data')