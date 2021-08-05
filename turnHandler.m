%Nicholas Csapo
%Function definition to be called when a player adds a checker, it takes
%3 parameters, the player making the move, the column to be placed in and
%the zero matrix tracker. The function outputs who the next player will be
%and updates the zero matrix
function [updatedBoard, nextPlayer] = turnHandler(player, column, tracker, aiType, btnMatrix)
    win = 0;
    %Matrix to keep track of Y-coordinates to place checkers
    positions = [1.75 2.75 3.75 4.75 5.75 6.75 7.75; 1 2.25 3.5 4.75 6 7.25 0];
    %loop through each row in the column
    for row = 1:6
        %If the current space in the matrix is 0, make it 1 and add a
        %checker
        if tracker(7-row,8-column) == 0
            text(1,positions(1,column),positions(2,row),int2str(player));
            tracker(7-row,8-column) = player;
            break;
        end
        %If column is full, make the player choose again
        if row == 6
            if player == 1
                player = 2;
            else
                player = 1;
            end
        end
    end
    %disp(tracker);
    %Check the matrix for a winner with a metric s**t ton of if statements
    win = checkWinner(tracker,player, btnMatrix);
    
    
    %Sorts out who will go next depending on who just went
    if aiType == 1
        if player == 1
            nextPlayer = 2;
        else
            nextPlayer = 1;
        end
    else
        if win ~= 1
            tracker = AI(aiType, tracker, btnMatrix);
        end
        nextPlayer = 1;
    end
    updatedBoard = tracker;
end

%All possible coordinates for checkers
%x = 1
%y = 1.75, 2.75, 3.75...7.75
%z = 1, 2.25, 3.50, 4.75, 6, 7.25