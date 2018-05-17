function [content,connector,found]=connect_down_bond(content,connector, i,h,omega,Q_theme)
%finds generator to connect to open down bond (i,h,omega)
load c:\mind_data G mod_transfer gs_in_mod Q A T
g=content(i,2);n=length(content(:,1));
if ~isempty(connector)
    m=length(connector(:,1));
else m=0;
end
    

%connect generator to what? Set of "to_gs" =v;
s=G(g);
mod=s.modality;
to_mods=mod_transfer{mod,omega};to_gs=gs_in_mod(to_mods);n_to_gs=length(to_gs);
if isempty(to_gs)
    found=0;
    return
end

%connect to g's?
v=[];
for nu=1:n_to_gs
    v=[v,to_gs{nu}];
end
to_gs=v;
old_gs= ismember(content(:,2),to_gs);
    if any(old_gs)
        u=content(:,1);v=content(:,2);
        to_h=u(logical(old_gs));
        to_g=v(logical(old_gs));n_to_h=length(to_h);
        
        %random selection
        probs=[];
        for nu=1:n_to_h
      prob=Q(v(nu))*n/(n+1);prob= prob*A(g,v(nu))^(1/T);probs=[probs,prob];
        end
   probs=probs./sum(probs);
   nu=select(probs);
        
        
        to_h=to_h(nu);
        t=isempty(connector);
        if t==1
            connector=[h,to_h,omega];
            found=1;
            return
        end
        already_connected=(connector(:,1)==h)&(connector(:,2)==to_h);%error?
        if ~any(already_connected)
               connector=[connector;[h,to_h,omega]];
               found=1;
               return
         end
        %else find new g to connect to
    end  
         %sample from probs over set "to_gs"
         probs=[];
         for mu=1:n_to_gs
             prob=Q_theme(to_gs(mu))*mu/(n+1);prob= prob*A(g,to_gs(mu))^(1/T);probs=[probs,prob];
             probs=[probs,prob];
         end
         probs=probs./sum(probs); 
         new_g=select(probs);new_g=to_gs(new_g);
         %connect this "new_g" to old content, connector
         content=[content;[max(content(:,1))+1,new_g]];r=1:3;
         
            connector=[connector;[h,max(content(:,1)),omega]];%note that "content"already been incremented
            %[h,max(content(:,1)),omega]
            found=1;
        
    
 
  