function [content1,connector1]=dom_thought(content,connector)
%computes connected components in thought chatter and finds largest
%component
if isempty(connector) | isempty(content)
    content1=[];connector1=[];
    return
else
end

n=length(content(:,1));m=length(connector(:,1));
%create DI-graph
graph=zeros(n);
for j=1:m
    h1=connector(j,1);h2=connector(j,2);
    i1=find(content(:,1)==h1);
    i2=find(content(:,1)==h2);
    graph(i1,i2)=1;
end

%find connected components
[c,v]=conn_comp(graph);
    ls=sum((v>0),2);
    [y,i]=max(ls);
    is=v(i,:);is=find(is);is=v(i,is);
    if ischar(is)
        content1=content;connector1=connector;
        return
    else
    end
 content1=content(is,:);
 %find rows in new connector1
 connector1=[];
 for j=1:m
     if ismember(connector(j,1),content1(:,1))&ismember(connector(j,2),content(:,1))
         connector1=[connector1;connector(j,:)];
     end
 end
