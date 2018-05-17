function print_mod_transfer_new(mod_transfer,modalities,n1,n2)
%prints "mod_transfer" with character names od modalities
%starts at mod n1,ends with mod n2
N=length(mod_transfer);
for k=n1:n2
    for j=1:3
    v=mod_transfer{k,j};
    disp(['modality no. ',num2str(k),' ',modalities(k,:),' to modalities no. ',num2str(v)])
   
    
        modalities(v,:)
        
    
    disp('__________________________________________________________________')
    end
end
