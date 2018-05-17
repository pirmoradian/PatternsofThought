function continuous_thought_save
load('C:\mind_data');
    clf
    answer=questdlg('MORE CONTINUOUS THOUGHT ?', 'YES','NO');
    if answer==2
        return
    end
    duration=menu(['HOW MANY SECONDS OF CONTINUOUS THOUHT  ? '],'20','40','60','80');
    duration=duration*20;%duration=str2num(duration)
    t0=clock;genre_old=1;
 
 
      while etime(clock,t0)<duration  
            genre=select(ones(1,9)./9);       
            if ~(genre==genre_old)
                figure('Units','Normalized','Position',[0 0 1 1])
                axis off
                clf  
                text(.01, .5,['MIND TRAJECTORY CHANGES DIRECTION'],'FontSize',26,'Color','y')
                axis off
                pause(.6)            
            else
            end
             content=[];load('c:\mind_data') 
             %create thought germ "content,connector"
             [content,connector]=think2(genre);
             [content,connector]=add_generator_up_Q(content,connector,genre);
       [content,connector]=add_generator_up_Q(content,connector,genre);
             %[content,connector,Q_theme]=build_thought_mod(genre);
             %see_mind_germ(content,[])
             pause(3)
             close all
             w=[];
             if isempty(content)
                 figure('Units','Normalized','Position',[0 0 1 1])
                  text(.2,.1 ,['EMPTY MIND'],'Color','r','FontSize',20)
                  axis off
                  pause(1)
             else
             v=content(:,2);n_v=length(v);
             k=1:n_v;
             g=G(v(k));
             w=[w,g.level];
             if all(ismember(w,1))
                  figure('Units','Normalized','Position',[0 0 1 1])
                  text(.2,.1 ,['STOP THINKING!   NO OPEN BONDS!'],'Color','r','FontSize',20)
                  axis off
                  pause(1)
             end
             end
             %is any down bond open?
             found=1;
             while found==1
                [i,h,omega,found]=find_open_down_bond(content,connector);
                if found==0
                        see_mind(content,connector)
                        pause(1)
                        close all
                        %return here?
                 else
                        [content,connector,found]=connect_down_bond(content,connector, i,h,omega,Q_theme);      
                        see_mind(content,connector)
                        pause(1)
                 end
 
              end
              see_mind(content,connector);
              pause(1.6)
              close
       [content,connector]=add_generator_up_Q(content,connector,genre);
       [content,connector]=add_generator_up_Q(content,connector,genre);
        see_mind(content,connector);
        pause(1.6)
        [content,connector]=delete_generator_connections(content,connector);
              pause(1.6)
              see_mind(content,connector);
              close
              
              [content,connector]=dom_thought(content,connector);
              see_mind_dom(content,connector);
              pause(3)  
              genre_old=genre;   
              close all
      end
  %now detect top_2ideas  
    [top_2ideas_g,top_2ideas_h]=get_top_2ideas(content,connector); %these are the top_2ideas
    n_ideas=length(top_2ideas_g); 
    ns=zeros(1,n_ideas);
    if n_ideas ==0
        figure('Units','Normalized','Position',[0 0 1 1])
        axis off
        text(.2,.8,'No Conscious Thought','FontSize',32) 
       % text(.8,.1,['Press Enter to Continue'],'FontSize',8)
        pause(2)
        return
    end

    for t=1:n_ideas
         gs=top_2ideas_g{1,t,:}; ns(t)=length(gs);
    end
    [Y,I]=max(ns);
    m=I(1); 
    hs=top_2ideas_h{1,m,:};gs=top_2ideas_g{1,m,:};
    content1(:,1)=hs';content1(:,2)=gs';n=length(hs);connector1=[];
    for k1=1:n
        for k2=1:n
            for j=1:3
                h1=hs(k1);h2=hs(k2);g1=gs(k1);g2=gs(k2);
            segment=(connector(:,1)==h1)&(connector(:,2)==h2)&(connector(:,3)==j);
                    if any(segment)&(g1~=g2)
                        connector1=[connector1;[h1,h2,j]];
                        else
                    end                      
             end
        end
    end
    %add new idea to "G"
    r=length(G);n_new_ideas=length(gs_in_mod{180});%note numbering of "new ideas " modality
    G(r+1).name=['<idea',num2str(n_new_ideas+1),'>'];
    G(r+1).level=1;
    G(r+1).modality=180;
g_mod=[g_mod,180];x=size(CREATION);
    n_new_idea=x(2);  
    CREATION{1,n_new_idea+1,1}=content1;
    CREATION{1,n_new_idea+1,2}=connector1;   
    Q=[Q,1];A_new=zeros(r+1);A_new(1:r,1:r)=A;A_new(r+1,:)=ones(1,r+1);A_new(:,r+1)=ones(r+1,1);A=A_new;
    figure('Units','Normalized','Position',[0 0 1 1])
    axis off
    text(.2,.8,'New Idea Created !','FontSize',32) 
    %text(.5,.1,['Press Enter to Continue'],'FontSize',20)
    %pause
    [L1,L2,L3,L4]=get_levels(G);
    clear content connector omega genre theme
    clear content1 connector1
    save c:\mind_data 



