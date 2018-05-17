function set_A
%defines the values of "A" as "amax" for links, "amin" for other
%combinations
amax=1.3;amin=.1;
load c:\mind_data 
r=length(G);
A=amin.*ones(r);
n_mod=length(mod_transfer(:,1));mods=[];
for m=1:n_mod
        g1s=gs_in_mod{m};
        mods=mod_transfer{m,1};        
        mods=[mods,mod_transfer{m,2}];       
        mods=[mods,mod_transfer{m,3}];
        n2_mods=length(mods);g2s=[];
        for k=1:n2_mods
        g2s=[g2s,gs_in_mod{mods(k)}];
        end
        A(g1s,g2s)=amax;A(g2s,g1s)=amax;
end

save c:\mind_data
        