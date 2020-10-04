% forces_moments.m
%   Computes the forces and moments acting on the airframe. 
%
%   Output is
%       F     - forces
%       M     - moments
%       Va    - airspeed
%       alpha - angle of attack
%       beta  - sideslip angle
%       wind  - wind vector in the inertial frame
%

function out = forces_moments(x, delta, wind, P)
    
    % relabel the inputs
    pn      = x(1);
    pe      = x(2);
    pd      = x(3);
    u       = x(4);
    v       = x(5);
    w       = x(6);
    e0      = x(7);
    e1      = x(8);
    e2      = x(9);
    e3      = x(10);
    p       = x(11);
    q       = x(12);
    r       = x(13);
    delta_e = delta(1);
    delta_a = delta(2);
    delta_r = delta(3);
    delta_t = delta(4);
    w_ns    = wind(1); % steady wind - North
    w_es    = wind(2); % steady wind - East
    w_ds    = wind(3); % steady wind - Down
    u_wg    = wind(4); % gust along body x-axis
    v_wg    = wind(5); % gust along body y-axis    
    w_wg    = wind(6); % gust along body z-axis
    
    
    % compute wind data in NED
    gust_wind_v = Quaternion2Rotation(x(7:10))*wind(4:6);
    w_n = w_ns + gust_wind_v(1);
    w_e = w_es + gust_wind_v(2);
    w_d = w_ds + gust_wind_v(3);
    
    % compute relative speed
    steady_wind_b = Quaternion2Rotation(x(7:10))'*wind(1:3); %steady wind defined in body frame
    u_r = u - (steady_wind_b(1) + u_wg);
    v_r = v - (steady_wind_b(2) + v_wg);
    w_r = w - (steady_wind_b(3) + w_wg);
    
    
    % compute air data
    Va = sqrt(u_r^2 + v_r^2 + w_r^2);
    alpha = atan2(w_r, u_r); %AOA
    beta = asin(v_r/Va); %sideslip
    
    
    
    % compute external forces and torques on aircraft
    Force(1) =  P.mass*2*P.gravity*(e1*e3 - e2*e0) + 0.5*P.rho*Va^2*P.S_wing*(C_x(alpha, P) + C_xq(alpha, P)*P.c/(2*Va)*q + C_x_delta_e(alpha, P)*delta_e) + 0.5*P.rho*P.S_prop*P.C_prop*((P.k_motor*delta_t)^2-Va^2);
    Force(2) =  P.mass*2*P.gravity*(e2*e3 - e1*e0) + 0.5*P.rho*Va^2*P.S_wing*(P.C_Y_0 + P.C_Y_beta*beta + P.C_Y_p*P.b/(2*Va)*p + P.C_Y_r*P.b/(2*Va)*r + P.C_Y_delta_a*delta_a + P.C_Y_delta_r*delta_r);
    Force(3) =  P.mass*P.gravity*(e3^2 + e0^2 - e1^2 - e2^2) + 0.5*P.rho*Va^2*P.S_wing*(C_z(alpha, P) + C_zq(alpha, P)*P.c/(2*Va)*q + C_z_delta_e(alpha, P)*delta_e);
    
    Torque(1) = 0.5*P.rho*Va^2*P.S_wing*(P.b*(P.C_ell_0 + P.C_ell_beta*beta + P.C_ell_p*P.b/(2*Va)*p + P.C_ell_r*P.b/(2*Va)*r + P.C_ell_delta_a*delta_a + P.C_ell_delta_r*delta_r)) - P.k_T_P*(P.k_Omega*delta_t)^2;
    Torque(2) = 0.5*P.rho*Va^2*P.S_wing*(P.c*(P.C_m_0 + P.C_m_alpha*alpha + P.C_m_q*P.c/(2*Va)*q + P.C_m_delta_e*delta_e));  
    Torque(3) = 0.5*P.rho*Va^2*P.S_wing*(P.b*(P.C_n_0 + P.C_n_beta*beta + P.C_n_p*P.b/(2*Va)*p + P.C_n_r*P.b/(2*Va)*r + P.C_n_delta_a*delta_a + P.C_n_delta_r*delta_r));
   
    out = [Force'; Torque'; Va; alpha; beta; w_n; w_e; w_d];
end
