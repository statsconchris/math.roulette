function rouletteStochastic(input) %e.g., fixed: input = 0. random: input = 1
%game variables
laps     = 1000000; 
gameFR   = randi([0,36],1,laps);
gameUS   = randi([0,37],1,laps); % 37 == 00 
pointsFR = zeros(1,laps);
pointsUS = zeros(1,laps);
winFR    = 0;
winUS    = 0;

        function number = FixedNumberBet()
            %game FR
            number = randi([0,36]);

            for i = 1:laps
                if   gameFR(i) == number
                          pointsFR(i) = pointsFR(i) + 35;
                          winFR = winFR + 1;
                else 
                          pointsFR(i) = pointsFR(i) - 1;
                end
            end
            
            %game US
            for i = 1:laps
                if   gameUS(i) == number
                          pointsUS(i) = pointsUS(i) + 35;
                          winUS = winUS + 1;
                else 
                          pointsUS(i) = pointsUS(i) - 1;
                end
            end

        end

    
        function RandomNumberBet() 
            %game FR
            for i = 1:laps
                if   gameFR(i) == randi([0,36])
                          pointsFR(i) = pointsFR(i) + 35;
                          winFR = winFR + 1;
                else 
                          pointsFR(i) = pointsFR(i) - 1;
                end
            end
            
            %game US
            for i = 1:laps
                if   gameUS(i) == randi([0,36])
                          pointsUS(i) = pointsUS(i) + 35;
                          winUS = winUS + 1;
                else 
                          pointsUS(i) = pointsUS(i) - 1;
                end
            end

        end


    if input == 0
        input = FixedNumberBet();
        title   = ['Your bet was #', num2str(input), ' in ' num2str(laps) ' games.'];
        x       = ['You won ', num2str(winFR * 100 / laps),'% games with ', num2str(sum(pointsFR)),' (', num2str(((laps + sum(pointsFR))/(2*laps)) * 100), '%) points in FR roulette.'];
        y       = ['You won ', num2str(winUS * 100 / laps),'% games with ', num2str(sum(pointsUS)),' (', num2str(((laps + sum(pointsUS))/(2*laps)) * 100), '%) points in US roulette.'];

        disp(title)
        disp(x)
        disp(y)
    else
        RandomNumberBet();
        title   = ['Your bet was Random in ', num2str(laps), ' games.'];
        x       = ['You won ', num2str(winFR * 100 / laps),'% games with ', num2str(sum(pointsFR)),' (', num2str(((laps + sum(pointsFR))/(2*laps)) * 100), '%) points in FR roulette.'];
        y       = ['You won ', num2str(winUS * 100 / laps),'% games with ', num2str(sum(pointsUS)),' (', num2str(((laps + sum(pointsUS))/(2*laps)) * 100), '%) points in US roulette.'];

        disp(title)
        disp(x)
        disp(y)    
    end

end


