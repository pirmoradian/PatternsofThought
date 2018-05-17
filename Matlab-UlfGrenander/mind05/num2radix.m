function gs=num2radix(N,r);
%transforms Godel number to radix representation with base "r"
u=N;gs=[];i=1;
while  floor(u)>0
   v=mod(floor(u),r);
   gs=[v,gs];
   u=u/r;
   
end
