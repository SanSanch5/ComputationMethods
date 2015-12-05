function cycles = getCycles(x)

cycles = {};
localCycle = 1;
found = [];
indexes = 1: size(x,1);

k = 1;
while size(found,1) ~= size(x,1)
    localCycleSize = size(localCycle,1);
    ind = localCycle(localCycleSize);
    found = [found; ind];
    cur = find(x(ind,:) == 1);
    if cur ~= localCycle(1)
        localCycle = [localCycle; cur];
    else
        cycles{k} = localCycle;
        k = k + 1;
        tmp = setdiff(indexes, found);
        if ~isempty(tmp)
            localCycle = tmp(1);
        end;
    end;
end;

