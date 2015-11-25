function cycles = getCycles(x)

cycles = {};
localCycle = 1;
found = 1;
indexes = 1: size(x,1);

k = 1;
while size(found,1) ~= size(x,1)
    localCycleSize = size(localCycle,1);
    ind = localCycle(localCycleSize);
    cur = find(x(ind,:) == 1);
    if cur ~= localCycle(1)
        found = [found; cur];
        localCycle = [localCycle; cur];
    end;
    if cur == localCycle(1) || size(found,1) == size(x,1)
        cycles{k} = localCycle;
        k = k + 1;
        tmp = setdiff(indexes, found);
        if ~isempty(tmp)
            localCycle = tmp(1);
            found = [found; tmp(1)];
        end;
    end;
end;
