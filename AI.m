%Nicholas Csapo
%defines function AI
function tracker = AI(type, tracker, btnMatrix)
    player = 2;
    %Choice is the AI's decision for what column to go to. If there is no
    %decision (choice = 0), then a random column will be chosen
    choice = 0;
%AI set to Really Easy
    if type==2
        %random # from 1->7
        choice = randi([1 7],1,1);

%AI set to Easy
    elseif type==3
        %Loop through rows and columns
        for row = 1:6
            for column = 1:7
                %check for across
                if column < 5
                    if tracker(row,column)==1 && tracker(row,column+1)==1 && tracker(row,column+2)==1 && tracker(row,column+3)==0 && tracker(row+1,column+3)~=0
                        choice = column + 3;
                        disp('need to go here');
                        disp(choice);
                        break;
                    elseif tracker(row+1,column)~=0 && tracker(row,column)==0 && tracker(row,column+1)==1 && tracker(row,column+2)==1 && tracker(row,column+3)==1
                        choice = column;
                        disp('need to go here');
                        disp(choice);
                        break;
                    end
                end
                %check for vertical
                if row < 4 && tracker(1,column)==0
                    if tracker(row,column)==0 && tracker(row+1,column)==1 && tracker(row+2,column)==1 && tracker(row+3,column)==1
                        choice = column;
                        disp('need to go here');
                        disp(choice);
                        break;
                    end
                end
                %check for four diagonal downward
                if row < 4 && column < 5
                    if tracker(row,column)==1 && tracker(row+1,column+1)==1 && tracker(row+2,column+2)==1 && tracker(row+3,column+3)==0 && tracker(row+4,column+3)~=0
                        choice = column+3;
                        disp('need to go here');
                        disp(choice);
                    
                    elseif tracker(row+1,column)~=0 && tracker(row,column)==0 && tracker(row+1,column+1)==1 && tracker(row+2,column+2)==1 && tracker(row+3,column+3)==1
                        choice = column;
                        disp('need to go here');
                        disp(choice);
                    end
                end
                %check for four diagonal upward
                if row >3 && column < 5
                    if tracker(row,column)==1 && tracker(row-1,column+1)==1 && tracker(row-2,column+2)==1 && tracker(row-3,column+3)==0 && tracker(row-2,column+3)~=0
                        choice = column+3;
                        disp('need to go here');
                        disp(choice);
                    
                    elseif tracker(row+1,column)~=0 && tracker(row,column)==0 && tracker(row-1,column+1)==1 && tracker(row-2,column+2)==1 && tracker(row-3,column+3)==1
                        choice = column;
                        disp('need to go here');
                        disp(choice);
                    end
                end 
            end
        end
        if choice == 0
            while choice==0 || tracker(1,choice)~=0
                choice = randi([1 7],1,1);
            end
        end
        choice = 8-choice;
%AI set to Hard
    elseif type==4
%.........................................................................
        %Play best move given current board layout i.e. has two in a row
        for r = 1:6
            for c = 1:7
                %try for across
                if c~=1 && c~=7
                    if c<6 && tracker(r,c+1)==2 && tracker(r,c+2)==2 && tracker(r+1,c)~=0 && tracker(r,c)==0
                        choice = c;
                        disp('trying for triple across');
                        disp(choice);
                    elseif (c+3)<7 && tracker(r,c+1)==2 && tracker(r,c+2)==2 && tracker(r+1,c+3)~=0 && tracker(r,c+3)==0
                        choice = c+3;
                        disp('trying for triple across');
                        disp(choice);
                    end
                end
                if r<5 && tracker(1,c)==0
                    if tracker(r+1,c)==2 && tracker(r+2,c)==2 && tracker(r,c)==0
                        choice = c;
                        disp('trying for vertial');
                        disp(choice);
                    end
                end
            end
        end
%.........................................................................        
        %Check for 3 in a row to block
        for row = 1:6
            for column = 1:7
                %check for across
                if column < 5
                    %spot 4 missing
                    if tracker(row,column)==1 && tracker(row,column+1)==1 && tracker(row,column+2)==1 && tracker(row,column+3)==0 && tracker(row+1,column+3)~=0
                        choice = column + 3;
                        disp('found a, need to go here');
                        disp(choice);
                        break;
                    %spot 3 missing
                    elseif tracker(row,column)==1 && tracker(row,column+1)==1 && tracker(row,column+2)==0 && tracker(row+1,column+2)~=0 &&  tracker(row,column+3)==1
                        choice = column + 2;
                        disp('found a, need to go here');
                        disp(choice);
                        break;
                    %spot 2 missing
                    elseif tracker(row,column)==1 && tracker(row,column+1)==0 && tracker(row+1,column+1)~=0 && tracker(row,column+2)==1 &&  tracker(row,column+3)==1
                        choice = column + 1;
                        disp('found a, need to go here');
                        disp(choice);
                        break;
                    %spot 1 missing
                    elseif tracker(row+1,column)~=0 && tracker(row,column)==0 && tracker(row,column+1)==1 && tracker(row,column+2)==1 && tracker(row,column+3)==1
                        choice = column;
                        disp('found a, need to go here');
                        disp(choice);
                        break;
                    end
                end
                %check for vertical
                if row < 4 && tracker(1,column)==0
                    if tracker(row,column)==0 && tracker(row+1,column)==1 && tracker(row+2,column)==1 && tracker(row+3,column)==1
                        choice = column;
                        disp('found v, need to go here');
                        disp(choice);
                        break;
                    end
                end
                %check for four diagonal downward
                if row < 4 && column < 5
                    %spot 4 missing
                    if tracker(row,column)==1 && tracker(row+1,column+1)==1 && tracker(row+2,column+2)==1 && tracker(row+3,column+3)==0 && tracker(row+4,column+3)~=0
                        choice = column+3;
                        disp('found dd, need to go here');
                        disp(choice);
                    %spot 3 missing
                    elseif tracker(row,column)==1 && tracker(row+1,column+1)==1 && tracker(row+2,column+2)==0 && tracker(row+3,column+2)~=0 && tracker(row+3,column+3)==1
                        choice = column+2;
                        disp('found dd, need to go here');
                        disp(choice);
                    %spot 2 missing
                    elseif tracker(row,column)==1 && tracker(row+1,column+1)==0 && tracker(row+2,column+1)~=0 && tracker(row+2,column+2)==1 && tracker(row+3,column+3)==1
                        choice = column+2;
                        disp('found dd, need to go here');
                        disp(choice);
                    %spot 1 missing
                    elseif tracker(row+1,column)~=0 && tracker(row,column)==0 && tracker(row+1,column+1)==1 && tracker(row+2,column+2)==1 && tracker(row+3,column+3)==1
                        choice = column;
                        disp('found dd, need to go here');
                        disp(choice);
                    end
                end
                %check for four diagonal upward
                if row >3 && column < 5
                    %spot 4 missing
                    if tracker(row,column)==1 && tracker(row-1,column+1)==1 && tracker(row-2,column+2)==1 && tracker(row-3,column+3)==0 && tracker(row-2,column+3)~=0
                        choice = column+3;
                        disp('found du, need to go here');
                        disp(choice);
                    %spot 3 missing
                    elseif tracker(row,column)==1 && tracker(row-1,column+1)==1 && tracker(row-2,column+2)==0 && tracker(row-1,column+2)~=0 && tracker(row-3,column+3)==1
                        choice = column+2;
                        disp('found du, need to go here');
                        disp(choice);
                    %spot 2 missing
                    elseif tracker(row,column)==1 && tracker(row-1,column+1)==0 && tracker(row,column+1)~=0 && tracker(row-2,column+2)==1 && tracker(row-3,column+3)==1
                        choice = column+1;
                        disp('found du, need to go here');
                        disp(choice);
                    %spot 1 missing
                    elseif tracker(row+1,column)~=0 && tracker(row,column)==0 && tracker(row-1,column+1)==1 && tracker(row-2,column+2)==1 && tracker(row-3,column+3)==1
                        choice = column;
                        disp('found du, need to go here');
                        disp(choice);
                    end
                end 
            end
        end
%.........................................................................        
        %check for 2 in a row preparing a 3 in a row trap
        for r = 1:6
            for c = 2:4
                if tracker(r,c+1)==1 && tracker(r,c+2)==1 && tracker(r+1,c)~=0 && tracker(r,c)==0 && tracker(r,c+3)~=2
                    choice = c;
                    disp('found double, need to go here');
                    disp(choice);
                elseif tracker(r,c+1)==1 && tracker(r,c+2)==1 && tracker(r+1,c+3)~=0 && tracker(r,c+3)==0 && tracker(r,c)~=2
                    choice = c+3;
                    disp('found double, need to go here');
                    disp(choice);
                end
            end
        end
%.........................................................................        
        %Check if player has gone in the middle on the first move, nice try
        if tracker(6,4)==1 && tracker(6,1)==0 && tracker(6,2)==0 && tracker(6,3)==0 && tracker(6,5)==0 && tracker(6,6)==0 && tracker(6,7)==0
            choice = randi([1 2],1,1);
            if choice==1
                choice = 3;
            else
                choice = 5;
            end
        end
%.........................................................................
        %If about to win, play the winning move
        for row = 1:6
            for column = 1:7
                %check for across
                if column < 5
                    %spot 4 missing
                    if tracker(row,column)==2 && tracker(row,column+1)==2 && tracker(row,column+2)==2 && tracker(row,column+3)==0 && tracker(row+1,column+3)~=0
                        choice = column + 3;
                        disp('trying for a');
                        disp(choice);
                        break;
                    %spot 3 missing
                    elseif tracker(row,column)==2 && tracker(row,column+1)==2 && tracker(row,column+2)==0 && tracker(row+1,column+2)~=0 &&  tracker(row,column+3)==2
                        choice = column + 2;
                        disp('trying for a');
                        disp(choice);
                        break;
                    %spot 2 missing
                    elseif tracker(row,column)==2 && tracker(row,column+1)==0 && tracker(row+1,column+1)~=0 && tracker(row,column+2)==2 &&  tracker(row,column+3)==2
                        choice = column + 1;
                        disp('trying for a');
                        disp(choice);
                        break;
                    %spot 1 missing
                    elseif tracker(row+1,column)~=0 && tracker(row,column)==0 && tracker(row,column+1)==2 && tracker(row,column+2)==2 && tracker(row,column+3)==2
                        choice = column;
                        disp('trying for a');
                        disp(choice);
                        break;
                    end
                end
                %check for vertical
                if row < 4 && tracker(1,column)==0
                    if tracker(row,column)==0 && tracker(row+1,column)==2 && tracker(row+2,column)==2 && tracker(row+3,column)==2
                        choice = column;
                        disp('trying for v');
                        disp(choice);
                        break;
                    end
                end
                %check for four diagonal downward
                if row < 4 && column < 5
                    %spot 4 missing
                    if tracker(row,column)==2 && tracker(row+1,column+1)==2 && tracker(row+2,column+2)==2 && tracker(row+3,column+3)==0 && tracker(row+4,column+3)~=0
                        choice = column+3;
                        disp('trying for dd');
                        disp(choice);
                    %spot 3 missing
                    elseif tracker(row,column)==2 && tracker(row+1,column+1)==2 && tracker(row+2,column+2)==0 && tracker(row+3,column+2)~=0 && tracker(row+3,column+3)==2
                        choice = column+2;
                        disp('trying for dd');
                        disp(choice);
                    %spot 2 missing
                    elseif tracker(row,column)==2 && tracker(row+1,column+1)==0 && tracker(row+2,column+1)~=0 && tracker(row+2,column+2)==2 && tracker(row+3,column+3)==2
                        choice = column+2;
                        disp('trying for dd');
                        disp(choice);
                    %spot 1 missing
                    elseif tracker(row+1,column)~=0 && tracker(row,column)==0 && tracker(row+1,column+1)==2 && tracker(row+2,column+2)==2 && tracker(row+3,column+3)==2
                        choice = column;
                        disp('trying for dd');
                        disp(choice);
                    end
                end
                %check for four diagonal upward
                if row >3 && column < 5
                    %spot 4 missing
                    if tracker(row,column)==2 && tracker(row-1,column+1)==2 && tracker(row-2,column+2)==2 && tracker(row-3,column+3)==0 && tracker(row-2,column+3)~=0
                        choice = column+3;
                        disp('trying for du');
                        disp(choice);
                    %spot 3 missing
                    elseif tracker(row,column)==2 && tracker(row-1,column+1)==2 && tracker(row-2,column+2)==0 && tracker(row-1,column+2)~=0 && tracker(row-3,column+3)==2
                        choice = column+2;
                        disp('trying for du');
                        disp(choice);
                    %spot 2 missing
                    elseif tracker(row,column)==2 && tracker(row-1,column+1)==0 && tracker(row,column+1)~=0 && tracker(row-2,column+2)==2 && tracker(row-3,column+3)==2
                        choice = column+1;
                        disp('trying for du');
                        disp(choice);
                    %spot 1 missing
                    elseif tracker(row+1,column)~=0 && tracker(row,column)==0 && tracker(row-1,column+1)==2 && tracker(row-2,column+2)==2 && tracker(row-3,column+3)==2
                        choice = column;
                        disp('trying for du');
                        disp(choice);
                    end
                end 
            end
        end
%.........................................................................
        %Try to Prevent AI from choosing a space that will secure player 1 the win
        %check horizontal
        %for r = 2:6
        %    %if p1 wins spot 1
        %    if choice<5 && tracker(r-1,choice+1)==1 && tracker(r-1,choice+2)==1 && tracker(r-1,choice+3)==1
        %        choice = 0;
        %        disp('just kidding, not gonna let p1 win that easily');
        %    %if p1 wins spot 2
        %    elseif choice<6 && choice>1 && tracker(r-1,choice-1)==1 && tracker(r-1,choice+1)==1 && tracker(r-1,choice+2)==1
        %        choice = 0;
        %        disp('just kidding, not gonna let p1 win that easily');
        %    %if p1 wins spot 3
        %    elseif choice<7 && choice>2 && tracker(r-1,choice-2)==1 && tracker(r-1,choice-1)==1 && tracker(r-1,choice+1)==1
        %        choice = 0;
        %        disp('just kidding, not gonna let p1 win that easily');
        %    %if p1 wins spot 4
        %    elseif choice>3 && tracker(r-1,choice-1)==1 && tracker(r-1,choice-2)==1 && tracker(r-1,choice-3)==1
        %        choice = 0;
        %        disp('just kidding, not gonna let p1 win that easily');
        %    end
        %end
    end
%.........................................................................
%All ai will do this vvvvv 
    %If there is no move to make, or if the AI made a mistake, choose random spot
        if choice <= 0 || choice > 7 || tracker(1,choice)~=0
            choice = randi([1 7],1,1);
            while tracker(1,choice)~=0
                choice = randi([1 7],1,1);
            end
        end
        choice = 8-choice;
    %Matrix to keep track of Y-coordinates to place checkers
    positions = [1.75 2.75 3.75 4.75 5.75 6.75 7.75; 1 2.25 3.5 4.75 6 7.25 0];
    %loop through each row in the column
    for row = 1:6
        %If the current space in the matrix is 0, make it 1 and add a
        %checker
        if tracker(7-row,8-choice) == 0
            text(1,positions(1,choice),positions(2,row),int2str(player));
            tracker(7-row,8-choice) = player;
            break;
        end
    end
    
    checkWinner(tracker,player,btnMatrix);
end