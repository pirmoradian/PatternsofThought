function [content,connector]=delete_connector(content,connector)
load('C:\mind_data');
%differs from "delete_g"  in that content is not changed
load('C:\mind_data') 
%r=length(G);Q=ones(1,r);

n=length(content(:,1));
if isempty(connector)
   return
else
   m=length(connector(:,1));
   j_del=select(ones(1,m)./m)
   h1=connector(j_del,1);h2=connector(j_del,2);
   i1=find(content(:,1)==h1);i2=find(content(:,1)==h2);
   g1=content(i1,2);g2=content(i2,2);
   prob_del=(A(g1,g2)^(-1/T));
   prob_del=prob_del/(1+prob_del);
   answer =select([prob_del,1-prob_del]);
   if answer==1
      connector=connector([1:j_del-1,j_del+1:m],:);
   else
   end
end

