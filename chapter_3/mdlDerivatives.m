function xdot = mdlDerivatives(t, x, input, MAV)
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
    
    gamma_0 = J_x*J_z - J_xz^2;
    gamma(1) = J_xz*(J_x-J_y + J_z)/gamma_0;
    gamma(2) = (J_z*(J_z-J_y) + J_xz^2)/gamma_0;
    gamma(3) = J_z/gamma_0;
    gamma(4) = J_xz/gamma_0;
    gamma(5) = (J_z - J_x)/J_y;
    gamma(6) = J_xz/J_y;
    gamma(7) = ((J_x-J_y)*J_x + J_xz^2)/gamma_0;
    gamma(8) = J_x*J_z - J_xz^2;

    
    xdot(1:3) = [cos(theta)*cos(psi)   sin(phi)*sin(theta)*cos(psi) - cos(phi)*sin(psi)   cos(phi)*sin(theta)*cos(psi) + sin(phi)*sin(psi);
                cos(theta)*sin(psi)   sin(phi)*sin(theta)*cos(psi) + cos(phi)*sin(psi)   cos(phi)*sin(theta)*cos(psi) - sin(phi)*sin(psi);
                -sin(phi)   sin(phi)*cos(theta)     cos(phi)*cos(theta)]*[u;v;w];
    
    xdot(4) = r*v-q*w + 1/mass*f_x;
    xdot(5) = p*w - r*u + 1/mass*f_y;
    xdot(6) = q*u - p*v + 1/mass*f_z;
    
    xdot(7:9) = [1    sin(phi)*tan(theta) cos(phi)*tan(theta);
                0   cos(phi)    -sin(phi);
                0   sin(phi)/cos(theta)     cos(phi)/cos(theta)]*[p;q;r];
    xdot(10) = gamma(1)*p*q - gamma(2)*q*r + gamma(3)*l + gamma(4)*n;
    xdot(11) = gamma(5)*p*r - gamma(6)*(p^2-r^2) + 1/J_y*m;
    xdot(12) = gamma(7)*p*q - gamma(1)*q*r + gamma(4)*l + gamma(8)*n;
end

