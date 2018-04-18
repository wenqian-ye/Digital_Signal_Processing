  function [out] = myConvCol(img, vec)
  [r,c] = size(img);
  out = zeros(r+length(vec)-1,c);
  for i = 1:c
    out(:,i) = conv(im2double(vec), im2double(img(:,i)));
  end 
end