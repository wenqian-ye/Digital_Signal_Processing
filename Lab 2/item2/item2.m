n = 0:20;
y1=zeros(1,length(n));
y2=zeros(1,length(n));
x1=[1,zeros(1,20)];
x2=[zeros(1,4),1,zeros(1,16)];
for n=0:20
    if n-1==-1
        y1(1)=1;
    else
        y1(n+1) = n/(n+3)*y1(n)+x1(n+1);
    end
        

end
figure(1);
stem(y1);
title('y1[n] with x1[n]');
xlabel('n');
for n=0:20
    if n-1==-1
        y1(1)=0;
        
    else
        y1(n+1) = n/(n+3)*y1(n)+x2(n+1);
    end
end
figure(2);
stem(y1);
title('y1[n] with x2[n]');
xlabel('n');

for n=0:20
    if n-1==-1
        y2(1)=0.7*1+x1(n+1);
    else
        y2(n+1) = 0.7*y2(n)+x1(n+1);
    end
end
figure(3);
stem(y2);
title('y2[n] with x1[n]');
xlabel('n');

for n=0:20
    if n-1==-1
        y2(1) = 0.7*1+x2(n+1);
    else
        y2(n+1)=0.7*y2(n)+x2(n+1);
    end
end
figure(4)
stem(y2)
title('y2[n] with x2[n]');
xlabel('n');