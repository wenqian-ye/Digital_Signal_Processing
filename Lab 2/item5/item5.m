y = zeros(1,1000);

% y(0)=1;
% y(1)=6;
y(1)=6;
x = ones(2,1000);
for n=2:1000
    y(n) = 5*y(n-1) + x(n);
end

stem(y);

% this system is not stable, it's diverged.
