function think_old
%creates complete "thought" and displays 2-idea if there is one in thought
[content,connector]=think1;
hold on
load c:\mind_data 
%is there a 2-idea?
[top_2ideas_g,top_2ideas_h]=get_top_2ideas(content,connector);
if isempty(top_2ideas_g)
    close all
    return
end
[idea_content,idea_connector]=single_idea(content,connector,top_2ideas_g{1},top_2ideas_h{1});
close all
see_mind(idea_content,idea_connector)
hold on
figure('Units','Normalized','Position',[0 0 1 1])
   text(.5,.9,['ANALYSIS OF 2-IDEA'],'FontSize',16)
   axis off
   pause
   close all 
   hold off
   