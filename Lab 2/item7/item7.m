stat = imread('lena.gif');
%y[n] = (delta[n+1]-2delta[n]+delta[n-1])*x[n]
%So h[n] = delta[n+1]-2delta[n]+delta[n-1]
h = [1 -2 1];
out1 = zeros(512,514);
for n = 1:512
     out1(n,:) = conv(h, stat(n,:));
end
 figure(1);
 imshow(out1);
 %the image becomes rougher and more balck.
 out2 = zeros(514,512,'int8');
for n = 1:512
     out2(:,n) = conv(h,stat(:,n));
end
figure(2);
imshow(out2);
 %the image becomes smoother and more grey.