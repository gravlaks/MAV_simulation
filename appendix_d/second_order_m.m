function [sys, x0, str, ts] = second_order_m(t,x, u, flag, zeta, wn)
%SECOND_ORDER_M Simulink function 
    
    switch flag
        case 0
            [sys, x0, str, ts] = mdlInitializeSizes;
        case 1
            sys = mdlDerivatives;
        case 3
            sys = mdlOutputs(t, x, u, wn);
        otherwise
            sys = []
    end      
end

