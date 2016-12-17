function varargout = hodgkinHuxley(varargin)

global dvec initial_vec

if nargin == 0
    end_time = 50;
else
    end_time = varargin{1};
end

error_tolerance = odeset('RelTol', 1e-8, 'AbsTol', 1e-10);

[ts, vec] = ode45(dvec, [0 end_time], initial_vec, error_tolerance);
vs = vec(:,1);

if nargout == 0
    plot(ts, vs, 'linewidth', 2), hold
    xlabel('time  t  [ms]', 'fontsize', 16)
    ylabel('potential  v  [mV]', 'fontsize', 16)
    set(gca, 'fontsize', 16)
elseif nargout == 2
    varargout{1} = ts;
    varargout{2} = vs;
elseif nargout == 5
    varargout{1} = ts;
    varargout{2} = Vs;
    varargout{3} = vec(:,2);
    varargout{4} = vec(:,3);
    varargout{5} = vec(:,4);
end

end