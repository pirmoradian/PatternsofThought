function answer=connection_regular_new(i1,i2,j,content,connector,g_mod,mod_transfer)
%finds whether proposed connection i1->i2  for "j"th down bond is regular
answer=0;
if i1==i2 
    %same generator?
    return
end

%first check whether modalities satisfy regularity
h1=content(i1,1);h2=content(i2,2);
g1=content(i1,2);g2=content(i2,2);
mod1=g_mod(g1);mod2=g_mod(g2);
mod=mod_transfer{mod1,j};
if ismember(mod2,mod)
                answer=1;
                return   
end   
