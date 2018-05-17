function Idef=diffeo(Ibin,strength)
%transforms binary image Ibin by random diffeomorphism;strength is real parameter
%measuring the amount of deformation
[l1,l2]=size(Ibin);
%use 2*r^2 Fourier coefficients
r=5;
% for use in local group deformation compute basis function
v1=[1:l1];v2=[1:l2];w=[1:r];
M1=sin(pi/l1.*kron(v1,w'));M2=sin(pi/l2.*kron(v2,w'));
%and the two matrices
w=w.^2;
N1=kron(ones(1,r),w');N2=kron(w,ones(1,r)');

t1=strength.*randn(r);t2=strength.*randn(r);
s1=M1'*t1*M2;s2=M1'*t2*M2;
Idef=fastint(Ibin,s1,s2);

%display deformed image
image(30.*Idef)
