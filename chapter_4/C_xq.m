function result = C_xq(alpha, P)
%C_XQ Summary of this function goes here
%   Detailed explanation goes here
    result = -P.C_D_q*cos(alpha)+P.C_L_q*sin(alpha);
end

