function setup_current(A, deltaT)

global dV dn dm dh dvec

I = @(t) A*heaviside(t)*heaviside(deltaT - t);

dvec = @(t, vec) [dV(vec(1), vec(2), vec(3), vec(4), I(t)); ...
    dn(vec(1), vec(2)); ...
    dm(vec(1), vec(3)); ...
    dh(vec(1), vec(4))];
end