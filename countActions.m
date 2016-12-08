function out = countActions(Vs)

idxSpikes = find(Vs < -50);

if isempty(idxSpikes)
    out = 0;
else
    idxSpikes = idxSpikes - idxSpikes(1);
    N = length(idxSpikes);
    idxSpikes = idxSpikes - (0:N-1)';

    out = countJumps(idxSpikes) + 1;
    % If we call countJumps there was at least one Spike
end

end

function out = countJumps(vec)
% A recursive function to find all the jumps in the indices of the spikes

idx = find(vec, 1);

if isempty(idx)
    out = 0;
else
    vec = vec(idx:end);
    vec = vec - vec(1);
    
    out = countJumps(vec) + 1;
end

end
    