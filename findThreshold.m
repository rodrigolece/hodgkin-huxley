function [Amin, Amax] = findThreshold(deltaT, Amin, Amax, tol)

span = Amax - Amin;

while  span > tol
    A = 0.5*(Amin + Amax);
    
    setCurrent(deltaT, A)
    [~, Vs] = hodgkinHuxley();
    
    if countActions(Vs) == 1
        Amax = A;
    else
        Amin = A;
    end
    
    span = Amax - Amin;
end

end