%Nicholas Csapo
clc;

keywords = {'Visible','on'};
%Start Menu
menu = figure('name','Start Menu','pos',[150 150 300 125]);

uicontrol('Style','text',...
        'Position',[50 100 200 20],...
        'visible','on',...
        'String','Choose an Opponent');
%Start Button
uicontrol('Parent',menu,...
    'Style','pushbutton',...
    'String','Human',...
    'Position',[0 0 75 100],...
    'Callback','close(menu);aiType=1;set(board,keywords(1),keywords(2));');

uicontrol('Parent',menu,...
    'Style','pushbutton',...
    'String','Really Easy AI',...
    'Position',[75 0 75 100],...
    'Callback','close(menu);aiType=2;set(board,keywords(1),keywords(2));');

uicontrol('Parent',menu,...
    'Style','pushbutton',...
    'String','Easy AI',...
    'Position',[150 0 75 100],...
    'Callback','close(menu);aiType=3;set(board,keywords(1),keywords(2));');

uicontrol('Parent',menu,...
    'Style','pushbutton',...
    'String','Hard AI',...
    'Position',[225 0 75 100],...
    'Callback','close(menu);aiType=4;set(board,keywords(1),keywords(2));');

%this is the game board that the player sees
board = figure('name','C4','pos',[10 10 550 600],'visible','off');

%who's turn is it?
nextPlayer = 1;
%btn1-7 are the 7 buttons that show up under the board. Use these to add a
%checker into the board in the appropriate column. Each calls the addText.m
btnMatrix = [
uicontrol('Parent',board,'Style','pushbutton','String','1','Position',[50 60 50 20],'Callback','[tracker, nextPlayer] = turnHandler(nextPlayer,7,tracker,aiType,btnMatrix);'),...
uicontrol('Parent',board,'Style','pushbutton','String','2','Position',[100 60 50 20],'Callback','[tracker, nextPlayer] = turnHandler(nextPlayer,6,tracker,aiType,btnMatrix);'),...
uicontrol('Parent',board,'Style','pushbutton','String','3','Position',[150 60 50 20],'Callback','[tracker, nextPlayer] = turnHandler(nextPlayer,5,tracker,aiType,btnMatrix);'),...
uicontrol('Parent',board,'Style','pushbutton','String','4','Position',[200 60 50 20],'Callback','[tracker, nextPlayer] = turnHandler(nextPlayer,4,tracker,aiType,btnMatrix);'),...
uicontrol('Parent',board,'Style','pushbutton','String','5','Position',[250 60 50 20],'Callback','[tracker, nextPlayer] = turnHandler(nextPlayer,3,tracker,aiType,btnMatrix);'),...
uicontrol('Parent',board,'Style','pushbutton','String','6','Position',[300 60 50 20],'Callback','[tracker, nextPlayer] = turnHandler(nextPlayer,2,tracker,aiType,btnMatrix);'),...
uicontrol('Parent',board,'Style','pushbutton','String','7','Position',[350 60 50 20],'Callback','[tracker, nextPlayer] = turnHandler(nextPlayer,1,tracker,aiType,btnMatrix);')];
%matrix that defines the X-coordinates for the front rectangle
Xf = [1;1;1;1;1];
%matrix that defines the Y-coordinates for the front rectangle
Yf = [1;8;8;1;1];
%matrix that defines the Z-coordinates for the front rectangle
Zf = [0;0;8;8;0];

%matrix that defines the X-coordinates for the top rectangle
Xt = [1;1.25;1.25;1];
%matrix that defines the Y-coordinates for the top rectangle
Yt = [8;8.00;1.00;1];
%matrix that defines the Z-coordinates for the top rectangle
Zt = [8;8.00;8.00;8];

%matrix that defines the X-coordinates for the side rectangle
Xs = [1;1.25;1.25;1];
%matrix that defines the Y-coordinates for the side rectangle
Ys = [1;1;1;1];
%matrix that defines the Z-coordinates for the side rectangle
Zs = [8;8;0;0];

%Radius of the circles on the board
r=.4;
%teta (theta is already a function in MATLAB) used in drawing the circles
teta=-pi:0.01:pi;

%Y-Coordinates for each circle drawn
y1=r*cos(teta)+1.5;
y2=r*cos(teta)+2.5;
y3=r*cos(teta)+3.5;
y4=r*cos(teta)+4.5;
y5=r*cos(teta)+5.5;
y6=r*cos(teta)+6.5;
y7=r*cos(teta)+7.5;

%X-Coordinate for each circle drawn (all circles are at X=1)
x=ones(1,numel(y1));

%Z-Coordinate for each circle drawn
z1=r*sin(teta)+1;
z2=r*sin(teta)+2.25;
z3=r*sin(teta)+3.5;
z4=r*sin(teta)+4.75;
z5=r*sin(teta)+6;
z6=r*sin(teta)+7.25;

%plots the board and all 42 circles
plot3(Xf,Yf,Zf,Xt,Yt,Zt,Xs,Ys,Zs,x,y1,z1,x,y1,z2,x,y1,z3,x,y1,z4,x,y1,z5,x,y1,z6   ,x,y2,z1,x,y2,z2,x,y2,z3,x,y2,z4,x,y2,z5,x,y2,z6   ,x,y3,z1,x,y3,z2,x,y3,z3,x,y3,z4,x,y3,z5,x,y3,z6   ,x,y4,z1,x,y4,z2,x,y4,z3,x,y4,z4,x,y4,z5,x,y4,z6   ,x,y5,z1,x,y5,z2,x,y5,z3,x,y5,z4,x,y5,z5,x,y5,z6   ,x,y6,z1,x,y6,z2,x,y6,z3,x,y6,z4,x,y6,z5,x,y6,z6   ,x,y7,z1,x,y7,z2,x,y7,z3,x,y7,z4,x,y7,z5,x,y7,z6);
%0<=X<=5 (sets bounds of graph)
xlim([0 5]);
%0<=Y<=8
ylim([0,8]);
%0<=Z<=8
zlim([0,8]);

%This is the database for the game, the matrix of zeros that tracks all
%checkers placed
tracker = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0;0 0 0 0 0 0 0;3 3 3 3 3 3 3];