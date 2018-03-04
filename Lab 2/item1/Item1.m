stat = imread('lena.gif');
imshow('lena.gif');
h = (1/6)*[1 1 1 1 1 1];
out1 = zeros(512,517,'int8'); 
 
 s = waitbar(2,'Processing the picture, please wait');
 for n = 1:512
     out1(n,:) = conv2(h, stat(n,:));
 end
 
 imshow(out1);
 
out2 = zeros(517,512,'int8');
for n = 1:512
     out2(:,n) = conv(h,stat(:,n));
end
imshow(out2);
 
 
 out3 = zeros(517,517,'int8');
for n = 1:512
     out3(n,:) = conv2(h, stat(n,:));
 end
 close(s);
 imshow(out3);

