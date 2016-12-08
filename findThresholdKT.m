function [Kmin, Kmax] = findThresholdKT(A, deltaT, T, Kmin, Kmax, tol)

span = Kmax - Kmin;

while  span > tol
    K = 0.5*(Kmin + Kmax);
    
    setup2Currents(A, deltaT, K, T)
    [~, Vs] = hodgkinHuxley();
    
    if countActions(Vs) == 2
        Kmax = K;
    else
        Kmin = K;
    end
    
    span = Kmax - Kmin;
end

end