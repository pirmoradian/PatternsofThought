function [idea_content,idea_connector]=get_idea_thought(content,connector)
%displays one of the "ideas" in "thought"
[top_2ideas_g,top_2ideas_h]=get_top_2ideas(content,connector);
[idea_content,idea_connector]=single_idea(content,connector,top_2ideas_g{1},top_2ideas_h{1});

 
   