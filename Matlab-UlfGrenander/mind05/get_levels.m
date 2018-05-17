function [L1,L2,L3,L4]=get_levels(G);
%computes G-sets for level=1,1...
r=length(G);L1=[];L2=[];L3=[];L4=[];
for g=1:r
   l=G(g).level;
   if l==1
      L1=[L1,g];
   elseif l==2
      L2=[L2,g];
   elseif l==3
      L3=[L3,g];
   elseif l==4
      L4=[L4,g];
   end
   
end
   