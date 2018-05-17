function print_mod_transfer(mod_transfer)
%prints "mod_transfer"
l=length(mod_transfer)
for k=1:l
    disp([num2str(k),': ',num2str(mod_transfer{k,1}),' ; ' num2str(mod_transfer{k,2}),' ; ',num2str(mod_transfer{k,3})])
end                