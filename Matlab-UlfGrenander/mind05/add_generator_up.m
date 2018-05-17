function [content,connector]=add_generator_up(content,connector)
%executes free associations, upwards ideas
load('C:\mind_data');
%r=length(G);Q=ones(1,r);
if isempty(content)
   Q=Q./sum(Q);g=select(Q);
   content=[1,g];
else
   %select one of the gens in "content"
   n=length(content(:,1));i=select([1:n]./n);h=content(i,1);g=content(i,2);...
      mod=g_mod(g);
   mod_ups=mod_transfer_inv{mod};n_mod_ups=length(mod_ups);
   to_g_ups=[];
   %find generators up from which connection may be created
   for m=1:n_mod_ups
      to_g_ups=[to_g_ups,gs_in_mod{mod_ups(m)}];
   end
   %now try to connect up to each of these gens
   n_to_g_ups=length(to_g_ups);probs=[];
   if isempty(to_g_ups)
      return
   else
   end
   
   for nu=1:n_to_g_ups
      prob=Q(to_g_ups(nu))*mu/(n+1);prob= prob*A(g,to_g_ups(nu))^(1/T);probs=[probs,prob];
   end
   probs=probs./sum(probs);probs=[probs,1];
   nu=select(probs);
   if nu==n_to_g_ups+1
      return
   end
   h_new=max(content(:,1))+1;
      g_to=to_g_ups(nu);
      mod1=g_mod(g_to);
         for j=1:3
            h=content(i,1);
            if isempty(connector)     
               connector=[connector;[h_new,h,j]];
           else
            	is_old=any((connector(:,1)==h_new)&(connector(:,2)==h));
            is_old=is_old|any((connector(:,1)==h_new)&(connector(:,3)==j));
            	if (~is_old)&ismember(mod,mod_transfer{mod1,j});        
                  connector=[connector;[h_new,h,j]];
              else
              end
           end
         end
   content=[content;[h_new,g_to]];   
end
