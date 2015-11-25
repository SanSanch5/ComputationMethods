function res = mult_matrixes_mod_inf(m1, m2)

[m,n] = size(m1);
res = zeros(n, m);
for i=1:n
    for j=1:m
        if(m1(i,j) == 0 || m2(i,j) == 0)
            res(i, j) = 0;
        else
            res(i, j) = m1(i,j)*m2(i,j);
        end;
    end;
end;