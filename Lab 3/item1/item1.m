%H1
b1 = [2,0,5,4,0,0,-3];
a1 = [1 0];
H1 = tf(b1,a1,-1,'Variable','z^-1');
N=20;
figure(1);
subplot(121);
pzplot(H1);
subplot(122);
impz(b1,a1,N);
%H2
b2 = [3,2,0,-2];
a2 = [1 0];
H2 = tf(b2,a2,-1,'Variable','z^-1');
figure(2);
subplot(121);
pzplot(H2);
subplot(122);
impz(b2,a2,N);
%H3\
b3 = [0,0,0,1,0,0,1,-2];
a3 = [12,1,0,4];
H3 = tf(b3,a3,-1,'Variable','z^-1');
N = 20;
figure(3)
subplot(121)
pzplot(H3)
subplot(122)
impz(b3,a3,N)