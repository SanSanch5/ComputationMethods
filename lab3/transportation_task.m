function [ xx, ff ] = transportation_task(C, S, D, debug_mode)

[xx, indexes] = NW_angle(S, D);
ff = sum(sum(C.*xx));

if(debug_mode)
    fprintf('��������� ���� ���������:\n');
    disp(xx);
    fprintf('���������:');
    disp(ff);
    fprintf('�������� ���������� �������� 1:\n');
    disp(indexesToMatrix(indexes));
end;

k = 0;
while(true)
    k = k + 1;
    if(debug_mode)
        fprintf('�������� %d:\n', k);
    end;
    [ii, ji] = toBasis(C, indexes, debug_mode);
    if(ii == -1) 
        break;
    end;
    
    [xx, io, jo] = getOutOfBasis(xx, indexes, ii, ji);
    [~,ind] = ismember([io,jo], indexes, 'rows');
    indexes(ind,:) = [ii, ji];
    ff = sum(sum(C.*xx));
    
    if(debug_mode)
        fprintf('������� [%d, %d] � �����\n', ii, ji);
        fprintf('������� [%d, %d] �� ������\n', io, jo);
        fprintf('���� ���������:\n');
        disp(xx);
        fprintf('�������� ���������� �������� 1:\n');
        disp(indexesToMatrix(indexes));
        fprintf('���������:');
        disp(ff);
    end;
end;

end

