function [idea_content,idea_connector]=single_idea(content,connector,top_2idea_g,top_2idea_h)
%treats a single idea; note that "top_2idea_g" and "top_2idea_h" refer to a SINGLE idea
%they are given as vector;the program transforms to local i- and j-coordinates in "idea"
n_idea=length(top_2idea_g);idea_content=zeros(n_idea,2);
idea_content(:,1)=top_2idea_h';idea_content(:,2)=top_2idea_g';
%idea_connector contains connection inside "idea" 
idea_connector=[];
m=length(connector(:,1));h_set=top_2idea_h;conn=connector(:,1);
for h1=1:m
    for h2=1:m
        (ismember(conn(h1),h_set))&(ismember(conn(h2),h_set))
        if (ismember(conn(h1),h_set))&(ismember(conn(h2),h_set))
        idea_connector=[idea_connector;[connector(h1,:,:)]];
        end
    end
end

    
