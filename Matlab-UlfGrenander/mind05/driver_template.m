function [content,connector]=driver_template(driver,content,connector,content_idea,connector_idea )
%NOTE: DELETE_CONNECTOR HAS BEEN COMMENTED OUT TEMPORARILY TO MAKE SURE THAT
%NO CONNECTIONS ARE LEFT WITHOUT ATTACHED GENERATORS
%transforms mental state with driver expressed as "content_idea"+"connector_idea" 
%into new mental state. 
% use "name" instead of "driver" in line 0 (as character string) 
%include "G" in "driver" workspace!!!!!!!!!!!!!!!!!!!!!!
load(['\matlabr12\golem2\',driver]) 
s=select([activation_probability,1-activation_probability]);
if s==2
    return
end
load \matlabr12\golem2\mind_data2 class_idea
%check if driver is applicable to this drive
x=size(class_idea)

omega_driver=x(1);applicable=1;
for k=1:omega_driver
    if ~ismember(content_idea(k,:),class_idea(k,:))%perhaps cell structures?
        applicable=0;
    end
    
    if applicable
    
r=length(G);n=length(content(:,1));m=length(connector(:,1));
%only adds new connections inside idea; use i_ and j_coordinates
%formats:change_idea cell array (2,n_idea) with values in first row
% 'delete' meaning delete this generator
%'same' meaning same generator, unchanged
%'replace' by g
%'random' set of g's, randomly select one from this set
%in second row column 3 g-value; in second row column 4 set of g'values, other columns []
%format of ad_content: 2-column matrix , first column max(content(:,1))+1,
%second column g-values
%format of ad_connector: 3-column marrix with i-coorinates in first two columns, bond coordinate in third column
%format delet_connector: vector of j-coordinates

%keep configuration minus "idea"
keep_h=setdiff(content(:,1),content_idea(:,1));
keep_i=find(ismember(content(:,1),keep_h));
keep_content=content(keep_i,:);
keep_connector=find(ismember(connector(:,1),keep_h)&ismember(connector(:,2),keep_h));
keep_connector=connector(keep_connector,:);
between1=ismember(connector(:,1),keep_h)&ismember(connector(:,2),content_idea(:,1));
between2=ismember(connector(:,2),keep_h)&ismember(connector(:,1),content_idea(:,1));
keep_idea_connector=connector(find(between1'|between2'),:);
n=length(content(:,1));m=length(connector(:,1));
n_idea=length(content_idea(:,1));
n_ad=length(ad_content);
%n_delete=length(delete_content);

m_idea=length(connector_idea);
m_add=length(ad_connector);
m_delet=length(delet_connector);

%begin by changing values (no deletion yet)
del=zeros(1,n);
for i=1:n_idea
    if strcmp(change_idea{i,1},'delete')
        del(i)=1;
    elseif strcmp(change_idea{i,1},'same');   
    elseif strcmp(change_idea{i,1},'replace')
        content_idea(i,2)=change_idea{i,2};
    elseif strcmp(change_idea{i,1},'random')
        new_set=change_idea{i,4};n_new_set=length(new_set);
        choose=select([1:n_new_set]./n_new_set);
        content_idea(i,2)=new_set(choose);
    end
    
end

%then add new generators
content_idea=[content_idea;ad_content];
%then add new connections
if m_add>0
for j=1:m_add
    h1=ad_connector(j,1); h2=ad_connector(j,2);
    %h1=content_idea(1,i1); h2=content(1,i2);
    connector_idea=[connector_idea;[h1,h2,b]];   
    end
    
end

v=setdiff([1:n_idea],del);
content_idea = content_idea(v,:);
    
%now delete unneeded connections
%unneeded_i=find(content_idea(:,2));%in i-coordinates for "content_idea"
%unneeded_h=content(unneeded_i,1);
%un=union(ismember(connector_idea(:,1),unneeded_h),ismember(connector_idea(:,2),unneeded_h));
%un=find(un);m_new=length(connector_idea(:,1));
%connector_idea=connector_idea(setdiff([1:m_new],un),:);

%put transformed "idea" back into configuration
new_content=[keep_content;content_idea];

new_connector=keep_connector;
if ~isempty(connector_idea)
new_connector=[keep_connector;connector_idea];
end
if ~isempty(keep_idea_connector)   
new_connector=[new_connector;keep_idea_connector];
end
end
end
content=new_content;
connector=new_connector;




        


