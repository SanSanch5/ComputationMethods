function [ xx, ff ] = transportation_task(C, S, D, debug_mode)

[xx, indexes] = NW_angle(S, D);
ff = sum(sum(C.*xx));

if(debug_mode)
    fprintf('Начальный план перевозки:\n');
    disp(xx);
    fprintf('Стоимость:');
    disp(ff);
    fprintf('Базисные переменные отмечены 1:\n');
    disp(indexesToMatrix(indexes));
end;

k = 0;
while(true)
    k = k + 1;
    if(debug_mode)
        fprintf('Итерация %d:\n', k);
    end;
    [ii, ji] = toBasis(C, indexes, debug_mode);
    if(ii == -1) 
        break;
    end;
    
    [xx, io, jo] = getOutOfBasis(xx, indexes, ii, ji);
    [~,ind] = ismember([io,jo], indexes, 'rows');
    indexes(ind,:) = [ii, ji];
    ff = sum(sum(C.*xx));
    
    if(debug_mode)
        fprintf('Элемент [%d, %d] в базис\n', ii, ji);
        fprintf('Элемент [%d, %d] из базиса\n', io, jo);
        fprintf('План перевозки:\n');
        disp(xx);
        fprintf('Базисные переменные отмечены 1:\n');
        disp(indexesToMatrix(indexes));
        fprintf('Стоимость:');
        disp(ff);
    end;
end;

end

