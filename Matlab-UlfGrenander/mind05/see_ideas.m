function [content_ideas,connector_ideas]=see_ideas(content,connector)%DOES NOT WORK  FOR INCOMPLETE (sub-liminal) CONFIGURATIONS!
%displays diagram for ideas in the thought represented by configuration
if isempty(content)%|isempty(connector)
   return
end
tops=[];n=length(content(:,1));
for i=1:n
   x=content(i,1);% G-generator number
   if ~any(connector(:,2)==x)
		tops=[tops,x];
   end   
end

%load data needed..
load('C:\mind_data');

n_tops=length(tops);
for k=1:n_tops
    
   
   content_ideas=[];connector_ideas=[];
   top=tops(k);
   
   Gcoord = find(content(:,1) == top);
g=content(Gcoord,2);
%disp(['Idea no. ',num2str(k),':'])
%disp(G(g).name)
level=G(g).level;

if level==1
   else

old_level=top;n_old_level=length(old_level);

for l=(level-1):-1:1
   write=[];
   for u=1:n_old_level
      x=find(connector(:,1)==old_level(u));y=connector(x,2);%in generator number
      connector_ideas=[connector_ideas;connector(x,[1 2])];
      write=[write,y];
   end
   a=translate_h2g(content,write);
   if ~isempty(a)
   q=find(ismember(content(:,2),a));
   q=content(q,1);content_ideas=[content_ideas;content(q,:)];%???????
else
   end
  
 end  
end




end
pause(4)
close all
