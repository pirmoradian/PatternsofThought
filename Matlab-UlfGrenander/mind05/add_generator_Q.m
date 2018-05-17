function [content,connector]=add_generator_Q(content,connector,theme)
%differs from "add_g"  in that connector is not changed
load('c:\mind_data');
gs=set_gs_in_mods(theme,gs_in_mod);
Q(gs)=20;
g=select(Q./sum(Q));
if isempty(content)
   content=[content;[1,g]];
   return
end
n=length(content(:,1));
prob_add=(mu/(n+1))*Q(g);
prob_add=prob_add/(1+prob_add);
if select([prob_add,1-prob_add])==1
   content=[content;[1+max(content(:,1)),g]];
else
end

