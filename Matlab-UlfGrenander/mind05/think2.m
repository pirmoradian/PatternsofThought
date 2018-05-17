function [content,connector,genre]=think2
%simulates GOLEM for given theme of thoughts
content=[];load('c:\mind_data')  
%create thought germ "content,connector"
[content,connector,Q_theme,genre]=build_thought_2
see_mind_germ(content,[],genre)
content
if isempty(content)
    figure('Units','Normalized','Position',[0 0 1 1])
    axis off
    text(.5,.5, 'EMPTY MIND','Color','r','Fontsize',30)
    pause(1)
    
    return
elseif ~isempty(content)
   
close all
w=[];
v=content(:,2);n_v=length(v);
k=1:n_v;
g=G(v(k));
w=[w,g.level];
ismember(w,1);
if all(ismember(w,1))
    figure('Units','Normalized','Position',[0 0 1 1])
    text(.2,.1 ,['STOP THINKING!   NO OPEN BONDS!'],'Color','r','FontSize',20)
    axis off
    pause(1)
    return
end

%is any down bond open?
found=1;
while found==1
    [i,h,omega,found]=find_open_down_bond(content,connector);%_mod???????????????    
    if found==0
            see_mind(content,connector) 
             text(.2,.8,'Down bonds connected','Fontsize',15,'Color','y')
            pause(1)
            
            close all
            return
    elseif found==1
       [content,connector,found]=connect_down_bond(content,connector, i,h,omega,Q_theme);      
       see_mind(content,connector)
       text(.2,.8,'Connecting down bonds...','Fontsize',15,'Color','y')
       pause(1)
       
    end
 
end
end
