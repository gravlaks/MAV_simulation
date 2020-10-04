function xdot = mdlDerivativesQuat(t, x, input, MAV)
%MDLDERIVATIVES continuous derivative equation, xdot = f(t, x, u)
    pe = x(1);
    pn = x(2);
    pd = x(3);
    u = x(4);
    v = x(5);
    w = x(6);
    phi = x(7);
    theta = x(8);
    psi = x(9);
    p = x(10);
    q = x(11);
    r = x(12);
    
    %parameters for zagi wing, defined in appendix E
    J_x = MAV.Jx;
    J_y = MAV.Jy;
    J_z = MAV.Jz;
    J_xz = MAV.Jxz;
    mass = MAV.mass;
    %forces and moments as inputs
    f_x = input(1);
    f_y = input(2);
    f_z = input(3);
    l = input(4);
    m = input(5);
    n = input(6);
    
    gamma(1) = MAV.Gamma1;
    gamma(2) = MAV.Gamma2;
    gamma(3) = MAV.Gamma3;
    gamma(4) = MAV.Gamma4;
    gamma(5) = MAV.Gamma5;
    gamma(6) = MAV.Gamma6;
    gamma(7) = MAV.Gamma7;
    gamma(8) = MAV.Gamma8;
    
    quat = x(4:7);
    xdot(1:3) = Quaternion2Rotation(quat)*x(1:3);
    
    xdot(4) = r*v-q*w + 1/mass*f_x;
    xdot(5) = p*w - r*u + 1/mass*f_y;
    xdot(6) = q*u - p*v + 1/mass*f_z;
    
    lambda = 1000;
    xdot(7:10) = 1/2*[lambda*(1-norm(quat)^2) -p -q -r;
                      p lambda*(1-norm(quat)^2) r -q;
                      q -r lambda*(1-norm(quat)^2) p;
                      r q -p lambda*(1-norm(quat)^2)]*quat;
                  
    xdot(11) = gamma(1)*p*q - gamma(2)*q*r + gamma(3)*l + gamma(4)*n;
    xdot(12) = gamma(5)*p*r - gamma(6)*(p^2-r^2) + 1/J_y*m;
    xdot(13) = gamma(7)*p*q - gamma(1)*q*r + gamma(4)*l + gamma(8)*n;
end

