function result = C_z(alpha, P)
%C_XQ Summary of this function goes here
%   Detailed explanation goes here
    result = -C_D(alpha,P)*sin(alpha)-C_L(alpha, P)*cos(alpha);
end

