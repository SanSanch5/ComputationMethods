function [ xx, ff ] = transportation_task(C, S, D)

[xx, indexes] = NW_angle(S, D);
ff = sum(sum(C.*xx));

while(true)
    [ii, ji] = toBasis(C, indexes);
    fprintf('%d %d', ii, ji);
    if(ii == -1) 
        break;
    end;
    
    [xx, io, jo] = getOutOfBasis(xx, indexes, ii, ji);
    [~,ind] = ismember([io,jo], indexes, 'rows');
    indexes(ind,:) = [ii, ji];
    ff = sum(sum(C.*xx));
end;

end

