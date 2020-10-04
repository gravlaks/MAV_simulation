function result = C_L(alpha, P)
%C_L Summary of this function goes here
%   Detailed explanation goes here
    result = (1-sigmoid_fnc(alpha, P))*(P.C_L_0 + P.C_L_alpha*alpha) + sigmoid_fnc(alpha, P)*(2*sign(alpha)*sin(alpha)^2*cos(alpha));
end

