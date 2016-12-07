function setup2Currents(A, deltaT, K, T)

global dV dn dm dh dvec

I = @(t) twoCurrents(t, A, deltaT, K, T);

dvec = @(t, vec) [dV(vec(1), vec(2), vec(3), vec(4), I(t)); ...
    dn(vec(1), vec(2)); ...
    dm(vec(1), vec(3)); ...
    dh(vec(1), vec(4))];
end