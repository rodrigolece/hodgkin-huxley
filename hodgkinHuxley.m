function hodgkinHuxley()

global dvec end_time initial_vec error_tolerance

[ts, vec] = ode45(dvec, [0 end_time], initial_vec, error_tolerance);
Vs = vec(:,1);

plot(ts, -Vs)

end