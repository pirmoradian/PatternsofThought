function [content,connector]=add_generator_new(content,connector)
%differs from "add_g" in "january" in that connector is not changed
load('C:\mind_data');
%r=length(G);Q=ones(1,r);
g=select(Q./sum(Q));
%S:
disp([num2str(g),'= ',G(g).name,'  Q(g):',num2str(Q(g))]);
%S:
if isempty(content)
   content=[content;[1,g]];
   return
end
n=length(content(:,1));

%%AA
prob_add=(2/(n+1))*Q(g);
%check this!
prob_add=prob_add/(1+prob_add);
if select([prob_add,1-prob_add])==1
   content=[content;[1+max(content(:,1)),g]];
else
end
