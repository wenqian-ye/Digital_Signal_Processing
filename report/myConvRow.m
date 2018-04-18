function [out] = myConvRow(img, vec)
  [r,c] = size(img);
  out = zeros(r,c+length(vec)-1);
  for i = 1:r
    out(i,:) = conv(im2double(vec), im2double(img(i,:)));
  end 
end
    
    

    
    