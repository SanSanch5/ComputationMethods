function [ii, jj] = toBasis(C, indexes)

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
            if(nd < d)
                d = nd;
                ii = i;
                jj = j;
            end;
        end;
    end;
end;

end