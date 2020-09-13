function xdot = mdlDerivatives(t, x, u, zeta, wn)
%MDLDERIVATIVES continuous derivative equation, xdot = f(t, x, u)
    xdot(1) = -2*zeta*wn*x(1) -wn^2*x(2) + u;
    xdot(2) = x(1);
end

