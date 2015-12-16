C = dlmread('costs_lab1.txt');
S = dlmread('have_lab1.txt');
D = dlmread('need_lab1.txt');

clc;

if(sum(S) ~= sum(D))
    fprintf('Задача несбалансирована!');
else
    fprintf('Матрица стоимостей:\n');
    disp(C);
    fprintf('Источники:');
    disp(S);
    fprintf('Стоки:');
    disp(D);
   
    debug_mode = true;
    [transportation, cost] = transportation_task(C, S, D, debug_mode);
    
    fprintf('Оптимальный план перевозки:\n');
    disp(transportation);
    fprintf('Оптимальная стоимость:');
    disp(cost);
end;