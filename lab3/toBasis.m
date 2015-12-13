function [ii, jj] = toBasis(C, indexes, debug_mode)

[u, v] = getUV(C, indexes(:,1), indexes(:,2));
[m, n] = size(C);

mi = 1 - indexesToMatrix(indexes);

d = 0;
ii = -1;
jj = -1;
for i = 1: m
    for j = 1: n
        if(mi(i, j) == 1)
            nd = C(i, j)-u(i)-v(j);
            if(debug_mode)
                fprintf('d[%d,%d] = %d\n', i, j, nd);
            end;
            if(nd < d)
                d = nd;
                ii = i;
                jj = j;
            end;
        end;
    end;
end;
if(debug_mode)
    fprintf('\n');
    if(d ~= 0)
        fprintf('d[%d,%d] = %d минимально\n', ii, jj, d);
    else
        fprintf('Отрицательных d не найдено, последний найденный план оптимален\n');
    end;
end;

end