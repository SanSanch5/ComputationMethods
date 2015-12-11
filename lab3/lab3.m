C = dlmread('costs_lec.txt');
S = dlmread('have_lec.txt');
D = dlmread('need_lec.txt');

clc;
disp(C);
disp(S);
disp(D);

if(sum(S) ~= sum(D))
    fprintf('Задача несбалансирована!');
else
    [assignment, cost] = transportation_task(C, S, D);
    disp(cost);
end;