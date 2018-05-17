function [Q,A]=memory(content,connector)
%updates long term meory consisting og "Q" and "A"
load('c:\mind_data')
Q=Q.*.999;A=A.*.999;% forgetting ratio
if isempty(content)
    return
end

n=length(content(:,1));
for i=1:n
    g=content(i,2);Q(g)=Q(g)*1.1;
end
if ~isempty(connector)
m=length(connector(:,1));    
for j=1:m
    h1=connector(j,1);h2=connector(j,2);
    i1=find(content(:,1)==h1);g1=content(i1,2);
    i2=find(content(:,1)==h2);g2=content(i2,2);
    A(g1,g2)=A(g1,g2)*1.01; A(g2,g1)=A(g2,g1)*1.01;%remebering ratio
end

end
clear content connector content1 connector1
save('c:\mind_data')