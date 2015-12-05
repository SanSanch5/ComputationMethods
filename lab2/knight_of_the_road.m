function [assignment,cost] = knight_of_the_road(matr, debugging)

assignment = [0 1 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1; 1 0 0 0 0];
cost = sum(sum(mult_matrixes_mod_inf(matr, assignment)));
if debugging
    fprintf('\nНачальное x* = \n');
    disp(assignment);
    fprintf('\nНачальное f* = %d\n\n', cost)
end;

S = (matr);
[~,n] = size(matr);
k = 0;
while ~isempty(S)
    k = k + 1;
    m = S(:,:,1);
    S(:,:,1) = [];
    if debugging
        fprintf('Метод ветвей и границ для З.К. Итерация %d\n', k);
        fprintf('Матрица стоимостей подзадачи = \n');
        disp(matr)
    end;
    [xx,ff] = hungarian_method_mod_inf(m, false, false); 
    if debugging
        fprintf('\nf(opt) = %d\n\n', ff)
    end;
    if ff < cost
        if debugging
            fprintf('\nx(opt) = \n');
            disp(xx);
        end;
        cycles = getCycles(xx);
        if debugging
            fprintf('Циклы:\n');
            for i=1:size(cycles,2)
                disp(cycles{i}.');
            end;
        end;
        if size(cycles, 2) == 1 && size(cycles{1},1) == n
            if debugging
                fprintf('Новое минимальное решение f* = %d\n', ff);
            end;
            assignment = xx;
            cost = ff;
        else
            res_cycle = cycles{1};
            min_size = size(res_cycle, 1);
            for i=2:size(cycles,2)
                if size(cycles{i},1) < min_size
                    min_size = size(cycles{i}, 1);
                    res_cycle = cycles{i};
                end;
            end;
            subtask_cnt = size(S, 3);
            sub = m;
            sub(res_cycle(min_size), res_cycle(1)) = Inf;
            S(:,:,subtask_cnt+1) = sub;
            
            for i=1:min_size-1
                sub = m;
                sub(res_cycle(i), res_cycle(i+1)) = Inf;
                S(:,:,subtask_cnt+1+i) = sub;
            end;
        end;
    end;
end;