function path = findCycle(index, baseRow, matr, path, isFindInRow)

if(~isFindInRow)
    col = matr(:, index(2));
    rows = find(col==1);
    for i=1:length(rows)
        if(rows(i) ~= index(1))
            path = findCycle([rows(i), index(2)], baseRow, matr, path, ~isFindInRow);
            if(~isempty(path))
                ind = size(path, 1) + 1;
                path(ind,:) = index;
                return;
            end;
        end;
    end;
else
    if(index(1) == baseRow)
        ind = size(path, 1) + 1;
        path(ind,:) = index;
        return;
    else
        row = matr(index(1), :);
        cols = find(row==1);
        for i=1:length(cols)
            if(cols(i) ~= index(2))
                path = findCycle([index(1), cols(i)], baseRow, matr, path, ~isFindInRow);
                if(~isempty(path))
                    ind = size(path, 1) + 1;
                    path(ind,:) = index;
                    return;
                end;
            end;
        end; 
    end;
end;

end