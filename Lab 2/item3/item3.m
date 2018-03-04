load bitcoin.mat
n=50;
m=25;
x=newcoin;
y=0;
y1=zeros(1,length(x));
y2=zeros(1,length(x));
l=length(x);
temps = ones(1,51)/51;


for i = 1:413
    
    for j = 1:51
        if (i-j+1>0 && i-j +1 <=51)
        y1(i)=y1(i)+x(j)*temps(i-j+1);
       
        else
            continue;
        end

    end
end

for i = 1:413
    
    for j = 1:51
        if (i-j+1>1 && i-j +1 <=51)
        y2(i+25)=y2(i+25)+x(j)*temps(i-j+1);
       
        else
            continue;
        end

    end
end


y3 = conv(temps,x);
hold;
plot(x,'blue')
plot(y1,'black');
plot(y2,'red')
plot(y3,'green');