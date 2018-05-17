function [content,connector]=execute_driver(driver,content,connector)
%executes driver named "driver" for (total) idea={content,connector)
load('c:\mind_data')
if isempty(connector)
    return
end
n=length(content(:,1));m=length(connector(:,1));
[top_2ideas_g,top_2ideas_h]=get_top_2ideas(content,connector); %these are the top_2ideas
    n_ideas=length(top_2ideas_g); belongs_to_domain=zeros(1,n_ideas);
    domain=driver{6};
    %find if any of the top_2ideas in idea belongs to "domain" of "driver"
    %check each entry in of top_2idea w.r.t. "domain" of driver
    for k=1:n_ideas
        gs=top_2ideas_g{1,k,:}; n_gs=length(gs);above=gs(1);below=[];hs=top_2ideas_h{1,k,:};
        driv=driver{1};
        belongs_to_domain(k)= ismember(above,domain{1});
        for n=2:n_gs
            belongs_to_domain(k)=belongs_to_domain(k)&(ismember(gs(k),domain{k}))|isempty(domain{k});
        end
        %belongs_to_domain
        if ~belongs_to_domain
            return
        end
        first_idea=min(find(belongs_to_domain));
        gs=top_2ideas_g{1,first_idea,:};hs=top_2ideas_h{1,first_idea,:};n_idea=length(gs);
        %do not execute "driver" for the first idea with probability...
        if rand(1)>driver{5}
            return
        end
    end
    
        
        %now execute "change_idea" of "driver"
        change_idea=driver{1};dels=[];%i-numbers of deletions
        for i=1:n_idea %enumerates generators in sub-idea
            if strcmp(change_idea{i,1},'delete')
                dels(i)=1;
            else if strcmp(change_idea{i,1},'same')
            elseif  strcmp(change_idea{i,1},'replace')
                i_value=  find(content(:,1)== hs(i));g_new=change_idea{i,2};
                content(i_value,2)=g_new
            elseif strcmp(change_idea{i,1},'random')
                i_value=  find(content(:,1)== hs(i));
                g_set=change_idea{i,2};g_set_n=length(g_set);
                choose=select([1:g_set_n]./g_set_n);
                g_new=g_set(choose);
                content(i_value,2)=g_new;
            end
        end
        
        %deletes generators with dels==1 (i-numbers in sub-idea)
        del_h=hs(dels);
        if ~isempty(del_h)         
            i_dels=[];
            %delete generators
            for k=1:n
                i_dels=[i_dels,find(content(:,1)==del_h)];  
            content=content(setdiff([1:n],i_dels),:);
            end
            %delete connections
            j_s=[];
            for j=1:m
                j_s=[j_s,find(ismember(connector(j,1),del_h))|...
                        find(ismember(connector(j,2),del_h))];
            end
                connector=connector(setdiff([1:m],j_s),:);
        end  
        
        %add new generators
        ad_content=driver{2};      
        content=[content;ad_content]
        
        %add new connectors
        ad_connector=driver{3};
        connector=[connector;ad_connector];
        
        %delete connectors in "idea"
        delet_connector=driver{4};
        j=find((connector(:,1)==hs(1))&(connector(:,3)==delet_connector));
        m=length(connector(:,1));
        connector=connector(setdiff([1:m],j),:);  
        
    end