m=dlmread('input2.txt');
fprintf('������� ���������� = \n');
disp(m);

% � ���������� �������
[assignment,cost] = knight_of_the_road(m, true); 
fprintf('\nx* = \n');
disp(assignment);
fprintf('\nf* = %d\n\n', cost)