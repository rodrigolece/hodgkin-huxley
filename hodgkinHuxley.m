function varargout = hodgkinHuxley()

global dvec end_time initial_vec error_tolerance

[ts, vec] = ode45(dvec, [0 end_time], initial_vec, error_tolerance);
Vs = vec(:,1);

if nargout == 0
    plot(ts, Vs)
elseif nargout == 2
    varargout{1} = ts;
    varargout{2} = Vs;
elseif nargout == 5
    varargout{1} = ts;
    varargout{2} = Vs;
    varargout{3} = vec(:,2);
    varargout{4} = vec(:,3);
    varargout{5} = vec(:,4);
end

end