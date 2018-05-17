function [top_2ideas_g,top_2ideas_h]=get_top_2ideas(content,connector)
%computes only second level ideas; this MIND is intellectually challenged and 
%cannot think about abstractions of level greater than two
%produces only complete ideas
if isempty(connector)
    top_2ideas_g=[];top_2ideas_h=[];
    figure('Units','Normalized','Position',[0 0 1 1])
    axis off
    text(.2,.5,'No top-2ideas','FontSize',32)
    pause(2)
    close
    return
end
load('c:\mind_data')
tops_i=find(ismember(content(:,2),L2));%in i-coordinates
tops_g=content(tops_i,2);
%above in g-coordinates
tops_h=content(tops_i,1);
% above is in h-coordinates
n_tops=length(tops_i); top_2ideas_g=cell(1,n_tops);top_2ideas_h=cell(1,n_tops);
for k=1:n_tops   
   top_2ideas_g{1,k,1}=tops_g(k);
   top_2ideas_h{1,k,1}=tops_h(k);
   top_g=tops_g(k);top_h=tops_h(k);mod=G(top_g).modality;omega=mod_omegas(mod);
   f=find((connector(:,1)==top_h)&(connector(:,3)==1));
   if ~isempty(f)
   f1=connector(f,2);i=find(content(:,1)==f1);f=content(i,2);
   top_2ideas_g{1,k,:}=[top_2ideas_g{1,k,:},f];
   top_2ideas_h{1,k,:}=[top_2ideas_h{1,k,:},f1];
   end
   f=find((connector(:,1)==top_h)&(connector(:,3)==2));
   if ~isempty(f)
   f1=connector(f,2);i=find(content(:,1)==f1);f=content(i,2);
   top_2ideas_g{1,k,:}=[top_2ideas_g{1,k,:},f];
   top_2ideas_h{1,k,:}=[top_2ideas_h{1,k,:},f1];
   end
   f=find((connector(:,1)==top_h)&(connector(:,3)==3));
   if ~isempty(f)
   f1=connector(f,2);i=find(content(:,1)==f1);f=content(i,2);
   top_2ideas_g{1,k,:}=[top_2ideas_g{1,k,:},f];
   top_2ideas_h{1,k,:}=[top_2ideas_h{1,k,:},f1];
   end
end

%find complete ideas
complete=zeros(1,n_tops);
for k=1:n_tops
    v=top_2ideas_g{1,k,:};
    top=v(1);mod=g_mod(top);omega=mod_omegas(mod);
    if (length(v)==1+omega)
        complete(k)=1;
    end   
end

%now keep only complete ideas
top_2ideas_g=top_2ideas_g(find(complete));
top_2ideas_h=top_2ideas_h(find(complete));   
