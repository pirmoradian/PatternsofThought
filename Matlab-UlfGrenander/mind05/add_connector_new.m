function [content,connector]=add_connector_new(content,connector)
%differs from "add_g" in that conntent is not changed
load('C:\mind_data');
if isempty(content)
  return
   else
n=length(content(:,1));
for i1=1:n
   for i2=1:n      
   if isempty(connector)
      connector=[1,1,1];%this cludge to avoid error    
   else
       h1=content(i1,1);h2=content(i2,1);g1=content(i1,2);g2=content(i2,2);
      level1=G(g1).level;level2=G(g2).level;
      if level1==level2+1
        for j=1:3
            is_old=any((connector(:,1)==h1)&(connector(:,2)==h2));
            is_old=is_old|any((connector(:,1)==h1)&(connector(:,3)==j));
            reg=connection_regular_new(i1,i2,j,content,connector,g_mod,mod_transfer);      
            answer=(~is_old)&(g1~=g2)&(h1~=h2)&reg;
                if answer    
                    connector=[connector;[h1,h2,j]];
                end
        end
        end
   
    end
end
end

end





