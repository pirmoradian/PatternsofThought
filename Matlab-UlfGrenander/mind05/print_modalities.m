function print_modalities(modalities)
%print modalities with number
s=length(modalities(:,1));
for j=1:s
    display([num2str(j),['----'],modalities(j,:)])
end

        