function dftmat =  myMatrixDFT(N)

%  dftmat = DFT matrix of order N x N;
%  N = Order of the matrix
%     computes the DFT matrix of orer N x N;
%     DFT matrix is a n x n matrix defined as Wn=[(Wn)^km]
%     Wn=exp(-j*2*pi/n)
%Reference: Multirate Systems and Filter banks by P.P .Vaidyanathan
%Pearson Education 1993 appendix A.6

%%
if ~exist('N','var')
 N=input('Error: No value for the matrix order is specified.\nEnter the order of DFT matrix to be calculated   :');
end
for k=0:N-1
    for l=0:N-1
        w(k+1,l+1)=cos((2*pi*k*l)/N)-1i*sin((2*pi*k*l)/N);
    end
end

%% Return the DFT matrix
dftmat=w;