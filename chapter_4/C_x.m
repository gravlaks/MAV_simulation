function result = C_x(alpha, P)
%C_X Summary of this function goes here
%   Detailed explanation goes here
    result = C_D(alpha, P)*cos(alpha) + C_L(alpha, P)*sin(alpha);
end

