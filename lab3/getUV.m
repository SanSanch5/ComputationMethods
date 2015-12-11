function [u, v] = getUV(C, ui, vi)

m = length(unique(ui));
n = length(unique(vi));

    % решу через СЛАУ
coef = zeros(m+n);
y = zeros(1, m+n);
coef(1,1) = 1;
y(1) = 0;
k = 2;
for i = 1 : length(ui)
    coef(k, ui(i)) = 1;
    coef(k, m + vi(i)) = 1;
    y(k) = C(ui(i), vi(i));
    k = k + 1;
end;

x = coef^(-1)*y';
u = x(1:m);
v = x(m+1 : m+n);

end