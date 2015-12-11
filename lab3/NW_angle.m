function [x, indexes] = NW_angle(S, D)

m = length(S);
n = length(D);

i = 1;
j = 1;
x = zeros(m,n);
disp(x);
k = 1;
while (i <= m && j <= n)
    indexes(k,:) = [i, j];
    k = k + 1;
    if (D(j) > S(i))
        x(i, j) = S(i);
        D(j) = D(j) - S(i);
        i = i + 1;
    else
        x(i, j) = D(j);
        S(i) = S(i) - D(j);
        j = j + 1;
    end;    
end;
disp(x);
end

