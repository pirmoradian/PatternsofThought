function [content,connector,Q_theme,genre]=build_thought
% computes new thought from scratch (enpty "content") according to PRINIPLES
%executes theme driven associations
%NOTE: "connection_regular_new" has not yet been included
load C:\mind_data ;

%find gnerators in various levels
[L1,L2,L3,L4]=get_levels(G);

%select theme
number=menu('Select Theme of Mind','To Have and Have Not','Love and Hate',...
        'Sport','Business','Study','Health','Pets','Conversation','Politics');
    theme=THEMES{1,number,:};
    genre=number;
%find generators in "theme"    
gs=set_gs_in_mods(theme,gs_in_mod);content=[];connector=[];
Q(gs)=20;Q_theme=Q;

%thinking power defined in terms of size of "thought_germ"
prob_germ1=1./[1:4];prob_germ1=prob_germ1./sum(prob_germ1);
n_germ1=select(prob_germ1);
%S: n_germ is an interger from 1 to 4 
 
 %form sample of size "n_germ" on level 1
 level = 1;
 gs1=intersect(gs,L1);
 %S: return the values common to both gs and L1
 sample1=[];Q1=Q(gs1);sampl1=[];
 if ~isempty(gs1)
 for k=1:n_germ1
     sample1=[sample1,select(Q1./sum(Q1))];
 end
 sampl1=gs1(sample1);
end
 
 %now level 2
 prob_germ2=1./[1:4];prob_germ2=prob_germ2./sum(prob_germ2);
 n_germ2=select(prob_germ2)-1;
 gs2=intersect(gs,L2);
 sample2=[];Q2=Q(gs2);sapl2=[];
 if ~isempty(gs2)
 for k=1:n_germ2
     sample2=[sample2,select(Q2./sum(Q2))];
 end
 sampl2=gs2(sample2);
end

 %now level 3
 prob_germ3=3./[1:2];prob_germ3=prob_germ3./sum(prob_germ3);
 n_germ3=select(prob_germ3)-1;
 gs3=intersect(gs,L3);
 sample3=[];Q3=Q(gs3);sampl3=[];
 if ~isempty(gs3)
 for k=1:n_germ3
     sample3=[sample3,select(Q3./sum(Q3))];
 end
 sampl3=gs3(sample3);
end

 %now level 4
 prob_germ4=1./[1:1];prob_germ4=prob_germ4./sum(prob_germ4);
 n_germ4=select(prob_germ4)-1;
 gs4=intersect(gs,L4);
 sample4=[];Q4=Q(gs4);sampl4=[];
 if ~isempty(gs4)
 for k=1:n_germ4
     sample4=[sample4,select(Q4./sum(Q4))];
 end
 sampl4=gs4(sample4);
end

 
 n=length(sampl1)+length(sampl2)+length(sampl3)+length(sampl4);
 content(:,1)=[1:n]';
 if ~isempty(content)
 content(:,2)=[sampl1,sampl2,sampl3,sampl4]'
end 



 
    
 
 
    
