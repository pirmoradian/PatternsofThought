function find_g
%searches for generator number with given name
name=input( 'specify name  \n','s')
load c:\mind_data
r=length(G);
for g=1:r
    if strcmp(G(g).name,name)
        g
    end
end
