function [Amin, Amax] = findThreshold(deltaT, Amin, Amax, tol)

% The function is not general in the sense that it finds the threshold for
% negative currents only. For positive currents, Amin = A and Amax = A need
% to be exchanged.

span = Amax - Amin;

while  span > tol
    A = 0.5*(Amin + Amax);
    
    setCurrent(deltaT, A)
    [~, Vs] = hodgkinHuxley();
    
    if countActions(Vs) == 1
        Amin = A;
    else
        Amax = A;
    end
    
    span = Amax - Amin;
end

end