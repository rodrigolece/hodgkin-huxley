function out = twoCurrents(t, A, deltaT, K, T)

if t < deltaT
    out = A;
else
    out = K*heaviside(t - T)*heaviside(T + deltaT - t);
end

end