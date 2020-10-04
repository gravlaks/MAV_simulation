function result  = C_D(alpha, P)
%C_D Summary of this function goes here
%   Detailed explanation goes here
    result = P.C_D_p + (P.C_L_0 + P.C_L_alpha*alpha)^2/(pi*P.e*P.AR);
end

