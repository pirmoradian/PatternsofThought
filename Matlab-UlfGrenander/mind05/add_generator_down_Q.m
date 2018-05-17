function [content,connector]=add_generator_down_Q(content,connector,theme)
%executes theme driven associations, downwards ideas
%NOTE: "connection_regular_new" has not yet been included
load('C:\mind_data');
gs=set_gs_in_mods(theme,gs_in_mod);

Q(gs)=20;
if isempty(content)
   Q=Q./sum(Q);g=select(Q);
   content=[1,g];
   return
else
   %select one of the gens in "content"
   n=length(content(:,1));i=select(ones(1,n)./n);
   g=content(i,2);h=content(i,1);
   mod=g_mod(g); 
   to_g_downs=[gs_in_mod{mod_transfer{mod,1}},gs_in_mod{mod_transfer{mod,2}},...
         gs_in_mod{mod_transfer{mod,3}}]; 
   
   %now try to connect down to each of these gens
   probs=[];
   if isempty(to_g_downs)
      return
   else
   end 
   
      n_to_g_downs=length(to_g_downs);
   for nu=1:n_to_g_downs
      prob=Q(to_g_downs(nu))*mu/(n+1);prob= prob*A(g,to_g_downs(nu))^(1/T);probs=[probs,prob];
   end
   probs=[probs,1];
   probs=probs./sum(probs);
   nu=select(probs);
   %n_to_g_downs;
   if nu==n_to_g_downs+1
      return
      end
      g_to=to_g_downs(nu);
      new_h=max(content(:,1))+1;
     
 content=[content;[new_h,g_to]];
 
mod1=g_mod(g_to); 
if ~isempty(connector)
    for j=1:3
        is_old=any((connector(:,1)==h)&(connector(:,2)==new_h));
            is_old=is_old|any((connector(:,1)==h)&(connector(:,3)==j));
    	if (~is_old)&ismember(mod1,mod_transfer{mod,j});
       connector=[connector;[h,new_h,j]];
       
   else 
   end
    end     
else
  
end
end
