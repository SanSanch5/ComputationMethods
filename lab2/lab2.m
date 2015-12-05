m=dlmread('input2.txt');
clc;
fprintf('ћатрица стоимостей = \n');
disp(m);

% с отладочной печатью
[assignment,cost] = knight_of_the_road(m, true); 
fprintf('\nx* = \n');
disp(assignment);
fprintf('\nf* = %d\n\n', cost)