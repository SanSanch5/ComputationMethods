m=dlmread('input.txt');
fprintf('������� ���������� = \n');
disp(m);

% ����������� � ���������� �������
[assignment,cost] = hungarian_method(m, false, true); 
fprintf('\nx(opt) = \n');
disp(assignment);
fprintf('\nf(opt) = %d\n\n', cost);