function set2currents(deltaT, A, T, K)

global dV dn dm dh dvec

I = @(t) twoCurrents(t, deltaT, A, T, K);

dvec = @(t, vec) [dV(vec(1), vec(2), vec(3), vec(4), I(t)); ...
    dn(vec(1), vec(2)); ...
    dm(vec(1), vec(3)); ...
    dh(vec(1), vec(4))];
end

function out = twoCurrents(t, deltaT, A, T, K)

if t < deltaT
    out = A;
else
    out = K*heaviside(t - T)*heaviside(T + deltaT - t);
end

end
