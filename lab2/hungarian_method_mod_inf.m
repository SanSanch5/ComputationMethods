function [assignment,cost] = hungarian_method_mod_inf(matr, maximization, debugging)

costMat = matr;
if(maximization)
    costMat = -matr + max(max(matr));
end;

assignment = false(size(costMat));
cost = 0;

costMat(costMat~=costMat)=Inf;
validMat = costMat<Inf;
validCol = any(validMat);
validRow = any(validMat,2);

nRows = sum(validRow);
nCols = sum(validCol);
n = max(nRows,nCols);
if ~n
    return
end
    
dMat = zeros(n);
dMat(1:nRows,1:nCols) = costMat(validRow,validCol);

% ��� 1. ������ ����������� ������� �� ������ ������
dMat = bsxfun(@minus, dMat, min(dMat,[],2));

% ��� 2. ��� ������� ����: ���� ��� ������ ����� � ��� ������ ��� �������, ��
% �������� *
zP = ~dMat;
starZ = false(n);
while any(zP(:))
    [r,c]=find(zP,1);
    starZ(r,c)=true;
    zP(r,:)=false;
    zP(:,c)=false;
end

k=1;
while 1
    if(debugging)
        % ���������� ������
        fprintf('�������� %d:\n', k);
        k = k+1;
        for i=1:n
            for j=1:n
                if(starZ(i,j) == true)
                    fprintf('\t0*');
                else
                    fprintf(' \t%d', dMat(i,j));
                end;
            end;
            fprintf('\n');
        end;
        fprintf('\n');
    end;
    
% ��� 3. �������� �������, � ������� ���� 0*. ���� ��� ������ ��������, �� �������
% �������
    primeZ = false(n);
    coverColumn = any(starZ);
    if ~any(~coverColumn)
        break
    end
    coverRow = false(n,1);
    while 1
        % ��� 4. ������� 0 � ������������ �������� (�������) � �������� ���
        % ���� � ������ ��� ������� � ��� ��� 0*, �� ��������� � ���� 5.
        % ����� ������� ��������� �� ������� � 0* � �������� ������ � ����-
        % ��� 0'. ��������� �� ��� ���, ���� �� ��������� ������������ 
        % �����. ��������� ���������� �������� �� ������������ 
        % �������(�����) � ��������� � ���� 6.
        zP(:) = false;
        zP(~coverRow,~coverColumn) = ~dMat(~coverRow,~coverColumn);
        Step = 6;
        while any(any(zP(~coverRow,~coverColumn)))
            [uZr,uZc] = find(zP,1);
            primeZ(uZr,uZc) = true;
            stz = starZ(uZr,:);
            if ~any(stz)
                Step = 5;
                break;
            end
            coverRow(uZr) = true;
            coverColumn(stz) = false;
            zP(uZr,:) = false;
            zP(~coverRow,stz) = ~dMat(~coverRow,stz);
        end
        if Step == 6
            % ��� 6. �������� ���������� �������� �� ������� �����������
            % ������� � ��������� � ������ �������� ������. ������������ � 
            % ���� 4.
            M=dMat(~coverRow,~coverColumn);
            minval=min(min(M));
            if minval==inf
                return
            end
            dMat(coverRow,coverColumn)=dMat(coverRow,coverColumn)+minval;
            dMat(~coverRow,~coverColumn)=M-minval;
        else
            break
        end
    end
    % ��� 5. ������ L-�������.
    rowZ1 = starZ(:,uZc);
    starZ(uZr,uZc)=true;
    while any(rowZ1)
        starZ(rowZ1,uZc)=false;
        uZc = primeZ(rowZ1,:);
        uZr = rowZ1;
        rowZ1 = starZ(:,uZc);
        starZ(uZr,uZc)=true;
    end
end

% ����������
assignment(validRow,validCol) = starZ(1:nRows,1:nCols);
cost = sum(sum(mult_matrixes_mod_inf(matr, assignment)));