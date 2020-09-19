function result = C_x_delta_e(alpha, P)
%C_XQ Summary of this function goes here
%   Detailed explanation goes here
    result = -P.C_D_delta_e*cos(alpha)+P.C_L_delta_e*sin(alpha);
end

