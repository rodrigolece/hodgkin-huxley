function setV0(V_0)

global dV dn dm dh initial_vec end_time error_tolerance

% sympref('HeavisideAtOrigin', 1);

alpha_n = @(V) 0.01*(V + 10) / (exp((V + 10)/10) - 1);
beta_n = @(V) 0.125*exp(V/80);

alpha_m = @(V) 0.1*(V + 25) / (exp((V + 25)/10) - 1);
beta_m = @(V) 4*exp(V/18);

alpha_h = @(V) 0.07*exp(V/20);
beta_h = @(V) 1 / (exp((V + 30)/10) + 1);

C = 1;
g_k = 36;
g_na = 120;
g_l = 0.3;
V_k = 12;
V_na = -115;
V_l = -10.613;

dV = @(V, n, m , h, I) 1/C*( I -  g_k*n^4*(V - V_k) - ...
    g_na*m^3*h*(V - V_na) - g_l*(V - V_l) );
dn = @(V, n) alpha_n(V)*(1 - n) - beta_n(V)*n;
dm = @(V, m) alpha_m(V)*(1 - m) - beta_m(V)*m;
dh = @(V, h) alpha_h(V)*(1 - h) - beta_h(V)*h;

n_0 = alpha_n(V_0) / (alpha_n(V_0) + beta_n(V_0));
m_0 = alpha_m(V_0) / (alpha_m(V_0) + beta_m(V_0));
h_0 = alpha_h(V_0) / (alpha_h(V_0) + beta_h(V_0));

initial_vec = [V_0; n_0; m_0; h_0];

end_time = 50;
error_tolerance = odeset('RelTol', 1e-8, 'AbsTol', 1e-10);
end