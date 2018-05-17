function [content,connector]=delete_generator_connections(content,connector)
%this program deletes generator and associated connections
load('c:\mind_data');
if isempty(content)
   return
   else
      n=length(content(:,1));
      %select generator

     i_del=select(ones(1,n)./(n));%in i-coordiantes
      g=content(i_del,2);
if i_del>=n
   return
end
    
if isempty(connector)
   prob_del=(n/mu)/Q(g);  %check this!
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
prob_del=prob_del/(1+prob_del);
answer=select([prob_del,1-prob_del]);
if answer==1
   content=content([1:i_del-1,i_del+1:n],:);
   connector=connector(setdiff([1:m],[j_above',j_down']),:);
   
else
end
end
end
   