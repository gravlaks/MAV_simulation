function result = sigmoid_fnc(alpha, P)
%SIGMOID_FNC Summary of this function goes here
%   Detailed explanation goes here
    M = 10;
    result = (1+exp(-M*(alpha-P.alpha0)) + +exp(M*(alpha-P.alpha0)))/((1+exp(-M*(alpha-P.alpha0)))*(1+exp(M*(alpha-P.alpha0))));
end

