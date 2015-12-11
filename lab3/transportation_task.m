function [ xx, ff ] = transportation_task(C, S, D)

[xx, indexes] = NW_angle(S, D);
ff = sum(sum(C.*xx));

[ii, ji] = toBasis(C, indexes);
fprintf('%d %d', ii, ji);

[C, io, jo] = getOutOfBasis(C, ui, vi, ii, ji);

end

