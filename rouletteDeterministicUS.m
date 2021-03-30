function rouletteDeterministic(input) %e.g., red: input = 4
%game variables
laps     = 10; 
gameFR   = randi([0,36],1,laps);
gameUS   = randi([0,37],1,laps); % 37 == 00 

        % choosebet{1} to choosebet{7}
        zero   = (0); 
        even   = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36];
        odd    = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35];
        red    = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36];
        black  = [2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35];
        low    = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
        high   = [19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36];
        
        % choosebet{8} to choosebet{13}
        vleft  = [1,2,3,4,5,6,7,8,9,10,11,12];
        vmid   = [13,14,15,16,17,18,19,20,21,22,23,24];
        vright = [25,26,27,28,29,30,31,32,33,34,35,36];
        hup    = [3,6,9,12,15,18,21,24,27,30,33,36];
        hmid   = [2,5,8,11,14,17,20,23,26,29,32,35];
        hdown  = [1,4,7,10,13,16,19,22,25,28,31,34];

        choosebet = {zero;even;odd;red;black;low;high;vleft;vmid;vright;hup;hmid;hdown};
        bet = choosebet{input};
    
   
pointsFR = zeros(1,laps);
pointsUS = zeros(1,laps);
winFR    = 0;
winUS    = 0;

%Bet
for i = 1:laps
    
    %French Roulette
    if   ismember(gameFR(i),bet)
              if input >= 8                     % choosebet(8) to choosebet(13)
                pointsFR(i) = pointsFR(i) + 2;
                winFR = winFR + 1;
              elseif (input < 8) && (input > 1) % choosebet(2) to choosebet(7)
                pointsFR(i) = pointsFR(i) + 1;
                winFR = winFR + 1;
              else                              % choosebet(1) 
                pointsFR(i) = pointsFR(i) + 35;
                winFR = winFR + 1;  
              end
    else 
                pointsFR(i) = pointsFR(i) - 1;
    end
    
    %American Roulette 
    if   ismember(gameUS(i),bet)
              if input >= 8                     % choosebet(8) to choosebet(13)
                pointsUS(i) = pointsUS(i) + 2;
                winUS = winUS + 1;
              elseif (input < 8) && (input > 1) % choosebet(2) to choosebet(7)
                pointsUS(i) = pointsUS(i) + 1;
                winUS = winUS + 1;
              else                              % choosebet(1) 
                pointsUS(i) = pointsUS(i) + 17;
                winUS = winUS + 1;
              end
    else
              if input > 1
                pointsUS(i) = pointsUS(i) - 1;
              else
                pointsUS(i) = pointsUS(i) - 1;
              end
    end
    
end


namebet = {'zero','even','odd','red','black','low','high', ...
           'vleft','vmid','vright','hup','hmid','hdown'};

title   = ['Your bet was ' namebet{input} ' in ' num2str(laps) ' games.'];
x       = ['You won ', num2str(winFR * 100 / laps),'% games with ', num2str(sum(pointsFR)),' (', num2str(((laps + sum(pointsFR))/(2*laps)) * 100), '%) points in FR roulette.'];
y       = ['You won ', num2str(winUS * 100 / laps),'% games with ', num2str(sum(pointsUS)),' (', num2str(((laps + sum(pointsUS))/(2*laps)) * 100), '%) points in US roulette.'];

disp(title)
disp(x)
disp(y)


end



