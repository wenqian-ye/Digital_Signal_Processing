function h = response( n )

h = dirac(n+1) - 2*dirac(n) +dirac(n-1);
end

