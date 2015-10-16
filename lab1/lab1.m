m=dlmread('input.txt');
fprintf('Матрица стоимостей = \n');
disp(m);

% минимизация с отладочной печатью
[assignment,cost] = hungarian_method(m, false, true); 
fprintf('\nx(opt) = \n');
disp(assignment);
fprintf('\nf(opt) = %d\n\n', cost);