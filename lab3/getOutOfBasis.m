function [xx, io, jo] = getOutOfBasis(xx, indexes, ii, ji)

matr = indexesToMatrix(indexes);
index = [ii, ji];
path = findCycle(index, ii, matr, [], false);
path = flipud(path);

io = path(2,1);
jo = path(2,2);
m = xx(io, jo);
k = 4;
while(k <= size(path, 1))
    tm = xx(path(k,1), path(k,2));
    if(tm < m)
        io = path(k,1);
        jo = path(k,2);
        m = tm;
    end;
    k = k + 2;
end;

for k = 1: size(path, 1)
    i = path(k,1);
    j = path(k,2);
    if(mod(k, 2) ~= 0)
        xx(i,j) = xx(i,j) + m;
    else
        xx(i,j) = xx(i,j) - m;
    end;
end;

end