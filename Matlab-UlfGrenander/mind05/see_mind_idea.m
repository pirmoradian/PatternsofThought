function see_mind_idea(content,connector)
%displays current mind state as 2D graph
load('C:\mind_data') 

if isempty(connector)
   drawn=zeros(1);
else
s=max(max(connector));
drawn=zeros(s);
end
if isempty(content)
   figure('Units','Normalized','Position',[0 0 1 1])
   text(.5,.9,['EMPTY MIND'],'FontSize',22,'Color','r')
   axis off
return
end
level1=[];level2=[];level3=[];level4=[];n=length(content(:,1));
i1s=[];i2s=[];i3s=[];i4s=[];
for i=1:n
   if G(content(i,2)).level==1
      level1=strvcat(level1,G(content(i,2)).name);
      i1s=[i1s,i];
   elseif G(content(i,2)).level==2
      level2=strvcat(level2,G(content(i,2)).name);
      i2s=[i2s,i];
   elseif G(content(i,2)).level==3
      level3=strvcat(level3,G(content(i,2)).name);
      i3s=[i3s,i];
   elseif  G(content(i,2)).level==4
      level4=strvcat(level4,G(content(i,2)).name);
      i4s=[i4s,i];
   end
   
end
figure('Units','Normalized','Position',[0 0 1 1])
axis manual
hold on
text(.2,.9,['Generators encapsulated as an idea'],'FontSize',25)
hold on
xs=zeros(1,n);ys=zeros(1,n);

if ~isempty(level1)
wide1=length(level1(:,1));
y1s=.10.*ones(1,wide1);
x1s=cumsum([0,.15.*ones(1,wide1-1)]);
ys(i1s)=y1s;
xs(i1s)=x1s;
for nu=1:wide1
   text(x1s(nu),y1s(nu),[' ',level1(nu,:)],'Color','r','FontSize',15)
   hold on
end
end

if ~isempty(level2)
wide2=length(level2(:,1));
y2s=.35.*ones(1,wide2);
x2s=cumsum([0,.15.*ones(1,wide2-1)]);
ys(i2s)=y2s;xs(i2s)=x2s;
for nu=1:wide2
   text(x2s(nu),y2s(nu),[' ',level2(nu,:)],'Color','b','FontSize',15)
   hold on
end
end

if ~isempty(level3)
wide3=length(level3(:,1));
y3s=.65.*ones(1,wide3);
x3s=cumsum([0,.15.*ones(1,wide3-1)]);
ys(i3s)=y3s;xs(i3s)=x3s;
for nu=1:wide3
   text(x3s(nu),y3s(nu),[' ',level3(nu,:)],'Color','m','FontSize',15)
   hold on
end
end

if ~isempty(level4)
wide4=length(level4(:,1));
y4s=.85.*ones(1,wide4);
x4s=cumsum([0,.5.*ones(1,wide4-1)]);
ys(i4s)=y4s;xs(i4s)=x4s;
for nu=1:wide4
   text(x4s(nu),y4s(nu),[' ',level4(nu,:)],'Color','c','FontSize',25)
   hold on
end
end
axis off
hold on

%now draw connections
axis off
conn_color='kymg';
if ~isempty(connector)
   m=length(connector(:,1));
   for f=1:m
      h1=connector(f,1);h2=connector(f,2);
      i1=find(content(:,1)==h1);
      i2=find(content(:,1)==h2);
      hold on 
      
         
   plot([xs(i1), xs(i2)],[ys(i1),ys(i2)],conn_color(connector(f,3)),'LineWidth',5);
end
   
   title(' Black connector: j = 1. Yellow: j = 2. Magenta: j = 3','FontSize',16)
   else 
end
%pause
%close all






   
   
   
   
   
   
   
   
