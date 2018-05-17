function number=name_2_number(name)
%reads name of "idea" and computes its number
l=length(name);
if l==7
    x=name(6);
elseif l==8
    x=name([6 7]);
elseif l==9
    x=name([6 7 8]);
end
number=str2num(x);