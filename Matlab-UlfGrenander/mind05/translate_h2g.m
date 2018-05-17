function gs=translate_h2g(content,hs)
%translates generator numbers to G-numbers
load('C:\mind_data');
n_hs=length(hs);
gs=[];
for k=1:n_hs
   b=find(content(:,1)==hs(k));g=content(b,2);
   gs=[gs,g];
end
