function [content,connector]=delete_generator_keep_input(content,connector)
%this program has been written so that a simple modification (defining "n_input)
% will make the inputted "content" stay unchanged
load c:\matlabr12\golem2\mind_data2 A G Q T g_mod mod_transfer mu;
if isempty(content)
   return
   else
      n=length(content(:,1));
      %select generator, not input
n_input=0;
     i_del=n_input+select(ones(1,n-n_input)./(n-n_input));%in i-coordiantes
      g=content(i_del,2);
if i_del>n
   return
end
    
if isempty(connector)
   prob_del=(n/mu)/Q(g);%check this!
   prob_del=prob_del/(1+prob_del);
   if select([prob_del,1-prob_del])
      content=content([1:i_del-1,i_del+1],:);
      return
   end
else 
   m=length(connector(:,1));
   
   %bonds down to this generator from others above
   h=content(i_del,1);
j_above=find(connector(:,2)==h);%in j-coordinates
l_above=length(j_above);
product=n/(mu*Q(g));
for j=1:l_above
   j=j_above(j);h1=connector(j,1);
   i1=find(content(:,1)==h1);i2=find(content(:,1)==h);
   g1=content(i1,2);g2=content(i2,2);
   product=product*(A(g1,g2))^(-1/T);
end

%bonds up to this generator from others below
j_down=find(connector(:,1)==h);%in j-doordinates
l_down=length(j_down);
for j=1:l_down
   j=j_down(j);h2=connector(j,2);
   i1=find(content(:,1)==h);i2=find(content(:,1)==h2);
   g1=content(i1,2);g2=content(i2,2);
   product=product*(A(g1,g2))^(-1/T);
end

prob_del=product;%check this!
prob_del=prob_del/(1+prob_del)
answer=select([prob_del,1-prob_del]);
if answer==1
   content=content([1:i_del-1,i_del+1:n],:);
   connector=connector(setdiff([1:m],[j_above',j_down']),:);
   
else
end
end
end
   