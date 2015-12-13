C = dlmread('costs.txt');
S = dlmread('have.txt');
D = dlmread('need.txt');

clc;

if(sum(S) ~= sum(D))
    fprintf('������ ����������������!');
else
    fprintf('������� ����������:\n');
    disp(C);
    fprintf('���������:');
    disp(S);
    fprintf('�����:');
    disp(D);
   
    debug_mode = true;
    [transportation, cost] = transportation_task(C, S, D, debug_mode);
    
    fprintf('����������� ���� ���������:\n');
    disp(transportation);
    fprintf('����������� ���������:');
    disp(cost);
end;