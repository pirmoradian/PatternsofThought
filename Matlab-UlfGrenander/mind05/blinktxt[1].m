function blinktxt(x,y,str,prd)
%BLINKTXT - create a blinking text object
% BLINKTXT(X,Y,STR) creates a blinking text object at the position (X,Y) in
%  the current axes, using the string STR.  The default period is 0.5
%  seconds.
% BLINKTXT(X,Y,STR,PRD) uses the period PRD to control the blinking of the
%  text object.


% make sure there's an input
error(nargchk(3,4,nargin))

% if less than 4 inputs, set default value for 'prd'
if nargin < 4
    prd = .5;
end

% make sure 'str' is a string or cell array of strings
if ~ischar(str) && ~iscellstr(str)
    error('Input must be a string or a cell array of strings.')
end

% prepare axes
ax = newplot;

% create text object
txt = text(x,y,str,'Parent',ax);

% store the string in the text object's UserData
set(txt,'UserData',str);

% create timer object
tmr = timer('ExecutionMode','fixedRate',...
            'Name','BlinkingTextTimer',...
            'Period',prd,...
            'TimerFcn',{@blinkcallback,txt});
        
        
        
        
% start the timer        
start(tmr)
        
        
function blinkcallback(tmr,evd,txt)
%BLINKCALLBACK callback function to create blinking effect

% when you use a cell array with a function handle to set the TimerFcn
% callback, the first two inputs will always be the handle for the timer
% and event data, in that order.  Any additional elements in the cell array
% will become the third, fourth, fifth, etc. inputs

% use a try/catch block, if the figure is closed, and txt becomes an
% invalid handle, this will catch the error when you try to GET the String
% for txt

try
    % check the current String value
    str = get(txt,'String');

    if isempty(str)
        % get the stored string
        str = get(txt,'UserData');
        % use the stored string to restore the string
        set(txt,'String',str);
        % force MATLAB to redraw the figure
        drawnow
    else 
        % set to an empty string, to make it 'blink'
        set(txt,'String','')
        % force MATLAB to redraw the figure
        drawnow
    end
catch
    % if there was an error, stop and delete the timer
    % an error will occur if the figure is closed, since 'txt' will not be
    % a valid handle anymore.
    stop(tmr)
    delete(tmr)
end
