m=dlmread('input2.txt');
clc;
fprintf('������� ���������� = \n');
disp(m);

% � ���������� �������
[assignment,cost] = knight_of_the_road(m, true); 
fprintf('\nx* = \n');
disp(assignment);
fprintf('\nf* = %d\n\n', cost)