function class_idea = create_idea
    %Use local coordinates for idea. Only 2_top_idea allowed
    omega=input(' Down arity = \n');idea_class=cell(1,omega);
    load('C:\mind_data');
    r=length(G);Q=ones(1,r);
    for l=1:omega+1
       svar= input(['for bond no. ', num2str(l),' modality (1) or generators (2) ? \n'])
    if svar==1 
        mod=input('modality = ? \n');
        idea_class{1,l}=gs_in_mod(mod)
    elseif svar ==2
        gs=input('give vector of generators \n')
       idea_class{1,l}=gs;
    end
end
class_idea=idea_class;
%store this in driver ws
   
        