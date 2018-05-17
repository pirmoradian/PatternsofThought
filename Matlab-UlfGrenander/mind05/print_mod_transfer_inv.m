function print_mod_transfer_inv(mod_transfer_inv,modalities,n1,n2)
%prints "mod_transfer_inv" with character names od modalities
%starts at mod n1,ends with mod n2
N=length(mod_transfer_inv);
for k=n1:n2
    v=mod_transfer_inv{1,k};
    disp(['modality no. ',num2str(k),' ',modalities(k,:),' from modalities no. ',num2str(v)])
    s=length(v);
    for t=1:s
        modalities(t,:)
        
    end
    disp('__________________________________________________________________')
end
