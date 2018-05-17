
function external_world=sensory_new
%allows user to select input to MIND
%input formed by sub-scenes of related generators
load('C:\mind_data');
n_mods=max(g_mod);r=length(G);
mods=cell(1,n_mods);
n_sub_scene=1;
for u=1:n_mods
   mods{u}=modalities(u,[1:12]);
end

figure('Units','normalized','Position',[0 0 1 1])
axis off
text(.1,.5,'Select inputs to MIND: modalities and generators', 'FontSize',18)
text(.1,.4,'Make selection for related subsets of scene', 'FontSize',18)
pause(2)
pause
close all
new_sub_scene=1;
while new_sub_scene==1
   figure('Units','normalized','Position',[0 0 1 1])
   axis off 
   text(.1,.3,'Make selection for subset of scene', 'FontSize',18)
   pause(1)
   pause
   cont=1;
   sub_scene=[];
while cont==1
   m=menu('Select a modality', mods);
   generators=find(g_mod==m);
   %S:
   if(generators)
       g_names={G.name};g_names=g_names(generators);
   else
        g_names = {'EMPTY!'};    
   end    
   %S:
   
   g=menu('Select a generator', g_names);
   g_number=0;
   for h=1:r   
     if strcmp(G(h).name,g_names(g))
        g_number=h;
     else
     end
   end
   if g_number
     sub_scene=[sub_scene;[m,g_number]];
   end
close 
figure('Units','normalized','Position',[0 0 1 1])     
cont=menu('More generators in this subscene ?', 'No','Yes');
cont=cont-1;;
close
figure('Units','normalized','Position',[0 0 1 1])
axis off
text(.1,.2,'Make selection for next subset of scene', 'FontSize',18)

end
close
external_world{n_sub_scene}=sub_scene;n_sub_scene=n_sub_scene+1;
figure('Units','normalized','Position',[0 0 1 1])     
new_sub_scene=menu('More subscenes ?', 'No','Yes');
new_sub_scene=new_sub_scene-1;;
close
end

