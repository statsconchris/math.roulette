function rouletteMartingale(input) %e.g., red: input = 4
%variables del juego
laps     = 1000000; 
gameFR   = randi([0,36],1,laps); %solo se considera la ruleta francesa


        % choosebet{1} a choosebet{7}
        zero   = (0); 
        even   = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36];
        odd    = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35];
        red    = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36];
        black  = [2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35];
        low    = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
        high   = [19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36];
        
        % choosebet{8} a choosebet{13}
        vleft  = [1,2,3,4,5,6,7,8,9,10,11,12];
        vmid   = [13,14,15,16,17,18,19,20,21,22,23,24];
        vright = [25,26,27,28,29,30,31,32,33,34,35,36];
        hup    = [3,6,9,12,15,18,21,24,27,30,33,36];
        hmid   = [2,5,8,11,14,17,20,23,26,29,32,35];
        hdown  = [1,4,7,10,13,16,19,22,25,28,31,34];

        choosebet = {zero;even;odd;red;black;low;high;vleft;vmid;vright;hup;hmid;hdown};
        bet = choosebet{input};
     
%secuencia del juego
table_types = zeros(13,laps);
for i = 1:laps
    for j = 1:13
        if ismember(gameFR(i),choosebet{j})
            table_types(j,i) = 1;
        end
    end    
end
   
%sum_types: ¿cuantas veces el tipo de apuesta apareció en "laps" juegos?
sum_types = zeros(1,13);
for j = 1:13
      sum_types(j) = sum(table_types(j,:));
end

%graficar sum_types
figure;
subplot(1,2,1)
bar(sum_types)
xlabel('Tipo de apuesta') 
ylabel('Numero de veces') 
set(gca,'xtick',1:13,'xticklabel',{'zero','even','odd','red','black','low','high','Vleft','Vmid','Vright','Hup','Hmid','Hdown'});
set(gca, 'XTickLabelRotation', 90);


%variables de apuesta
j          = 0;
finish     = false;
pointsFR   = zeros(1,laps);
max_martingale   = 30; % elegir > 30 si aumentas "laps" o si ocurre un error
martingale = zeros(1,max_martingale); 


%juego
for i = 1:laps
    
        %resetear para continuar con una nueva ronda de Martingale   
        if finish == true
           finish = false;
           j = 0; 
        end
        
        %Martingale 
        if ismember(gameFR(i),bet) && finish == false
              if input >= 8                     % choosebet{8} a choosebet{13}
                pointsFR(i) = pointsFR(i) + 1*(2^j);
                finish = true;
                martingale(j+1) = martingale(j+1) + 1;
              elseif (input < 8) && (input > 1) % choosebet{2} a choosebet{7}
                pointsFR(i) = pointsFR(i) + 1*(2^j);
                finish = true;
                martingale(j+1) = martingale(j+1) + 1;
              end

        elseif ~ismember(gameFR(i),bet) && finish == false
              if input >= 8                     % choosebet{8} a choosebet{13}
                pointsFR(i) = pointsFR(i) - 1*(2^j);
              elseif (input < 8) && (input > 1) % choosebet{2} a choosebet{7}
                pointsFR(i) = pointsFR(i) - 1*(2^j);
              end
        end
    
        j =j+1;

end


namebet = {'zero','even','odd','red','black','low','high', ...
           'vleft','vmid','vright','hup','hmid','hdown'};

message   = ['Su apuesta fue ' namebet{input} ' en ' num2str(laps) ' juegos y gano ' num2str(sum(pointsFR)) ' USD.'];
disp(message)

subplot(1,2,2)
bar(martingale);
xlabel('j') 
ylabel('Numero de veces') 
set(gca,'xtick',1:max_martingale,'xticklabel',{'0','','2','','4','','6','','8','','10',  ...
                                              '','12','','14','','16','','18','','20', ...
                                              '','22','','24','','26', '','28','','30'}); %modificar xticklabel si max_martingale cambia
set(gca, 'XTickLabelRotation', 90);


end


