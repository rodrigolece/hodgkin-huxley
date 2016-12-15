function [Kmin, Kmax] = findThresholdTK(deltaT, A, T, Kmin, Kmax, tol)

span = Kmax - Kmin;

while  span > tol
    K = 0.5*(Kmin + Kmax);
    
    set2currents(deltaT, A, T, K)
    [~, Vs] = hodgkinHuxley();
    
    if countActions(Vs) == 2
        Kmax = K;
    else
        Kmin = K;
    end
    
    span = Kmax - Kmin;
end

end