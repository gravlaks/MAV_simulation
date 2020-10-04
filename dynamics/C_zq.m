function result = C_zq(alpha, P)
%C_XQ Summary of this function goes here
%   Detailed explanation goes here
    result = -P.C_D_q*sin(alpha)-P.C_L_q*cos(alpha);
end
