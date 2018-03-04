x = ones(1,50);
h = ones(1,50);
u = length(x);
v = length(h);
for n = 1:50

    x(n) = 0.95^n;
    h(n) = 0.95^n;
end

y1 = zeros(1,u+v-1);

for i = 1:u+v-1
    
    for j = 1:v
        if (i-j+1>0 && i-j +1 <=50)
        y1(i)=y1(i)+x(j)*h(i-j+1);
       
        else
            continue;
        end

    end
end
y2 = conv(x,h);
figure(1);
hold;
plot(x,'b');
figure(2);
plot(y2,'r');
figure(3);
plot(y1,'c');


x99 = zeros(1,99);
h99 = zeros(1,99);

for n = 1:99

    x(n) = 0.95^n;
    h(n) = 0.95^n;
end

y99 = conv(x,h);
figure(4);
plot(y99,'d');

%the output in (b) and (c) is close to (a), the values after index 50 are
%extremely small.
