x = linspace(-5,5,400);
y = linspace(-5,5,300);
[xx,yy] = meshgrid(x,y);
f = sinc(xx).*sinc(yy);
imagesc(x,y,f);
axis xy;
xlabel('x','fontsize',14);
ylabel('y','fontsize',14);
title('Title','fontsize',14);