%Nicholas Csapo
function win = checkWinner(tracker, player, btnMatrix)
    win = 0;
%Check the matrix for a winner with a metric s**t ton of if statements
    for row = 1:6
        for column = 1:7
            spaceValue = tracker(row,column);
            if spaceValue ~= 0
                %check for four across
                if column < 5
                    if tracker(row,column+1) == spaceValue && tracker(row,column+2)==spaceValue && tracker(row,column+3)==spaceValue
                        win=1;
                    end
                end
                %check for four vertical
                if row < 4
                    if tracker(row+1,column) == spaceValue && tracker(row+2,column)==spaceValue && tracker(row+3,column)==spaceValue
                        win=1;
                    end
                end
                %check for four diagonal downward
                if row < 4 && column < 5
                    if tracker(row+1,column+1)==spaceValue && tracker(row+2,column+2)==spaceValue && tracker(row+3,column+3)==spaceValue
                        win=1;
                    end
                end
                %check for four diagonal upward
                if row >3 && column < 5
                    if tracker(row-1,column+1)==spaceValue && tracker(row-2,column+2)==spaceValue && tracker(row-3,column+3)==spaceValue
                        win=1;
                    end
                end
            end
        end
    end
    
    %What do do if there's a winner
    if win ~= 0
        clc;
        winner = sprintf('Player %i is the winner!',player);
        set(btnMatrix,'Enable','off');
        disp(winner);
    end
    if all(tracker)
        set(btnMatrix,'Enable','off');
        disp('There is no winner');
    end
    %disp(tracker);
end