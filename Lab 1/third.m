x = linspace(-5,5,400);
y = linspace(-5,5,300);
[xx,yy] = meshgrid(x,y);
f = sinc(sqrt(xx.^2+yy.^2));
imagesc(x,y,f);
axis xy;
xlabel('x','fontsize',14);
ylabel('y','fontsize',14);
title('Title','fontsize',14);