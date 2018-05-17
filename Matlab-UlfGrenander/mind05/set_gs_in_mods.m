function gs=set_gs_in_mods(mods,gs_in_mod)
%computes vector of generators belonging to the modalities in vector "mods"
n_mods=length(mods);gs=[];
for t=1:n_mods
    gs=[gs,gs_in_mod{mods(t)}];
end
    