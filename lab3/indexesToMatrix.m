function matr = indexesToMatrix(indexes)

m = length(unique(indexes(:, 1)));
n = length(unique(indexes(:, 2)));
matr = zeros(m, n);

ui = indexes(:,1);
vi = indexes(:,2);
for i=1 : m+n-1
    matr(ui(i), vi(i)) = 1;
end;

end