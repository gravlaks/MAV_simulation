function result = sigmoid_fnc(alpha, P)
%SIGMOID_FNC Summary of this function goes here
%   Detailed explanation goes here

    top = 1+exp(-P.M*(alpha-P.alpha0)) + exp(P.M*(alpha+P.alpha0));
    bottom = (1+exp(-P.M*(alpha-P.alpha0)))*(1+exp(P.M*(alpha+P.alpha0)));
    result = top/bottom;
end

