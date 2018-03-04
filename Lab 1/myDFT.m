function  [X] = myDFT(x)
  
N = length(x);

X_i = 0; 
X = 0;
for k = 1:N
 for n = 1:N
 X_i(n) = x(n)*exp(-1i*2*pi*(n-1)*(k-1)/N);
 end
X(k) = sum(X_i);
end 

end
