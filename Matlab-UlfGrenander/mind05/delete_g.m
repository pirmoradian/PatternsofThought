function delete_g(g,G)
%deletes single generator "g" in "G"
r=length(G);
v=[[1:g-1],[g+1:r]];
G(v);