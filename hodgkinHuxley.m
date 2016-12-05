function varargout = hodgkinHuxley()

global dvec end_time initial_vec error_tolerance

[ts, vec] = ode45(dvec, [0 end_time], initial_vec, error_tolerance);
Vs = vec(:,1);

if nargout == 0
    plot(ts, -Vs)
else
    varargout{1} = ts;
    varargout{2} = Vs;
end

end