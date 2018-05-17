function mod_transfer_inv=get_mod_transfer_inv(mod_transfer)
%computs inverse of "mod_transfer"
n_mods=length(mod_transfer);mod_transfer_inv=cell(1,n_mods);n_mods
for mod=1:n_mods
	for k=1:n_mods
   	for j=1:3
         if ismember(mod,mod_transfer{k,j}) 
            mod_transfer_inv{mod}=[ mod_transfer_inv{mod},k];
        		else
      	end
   	end
	end
end
