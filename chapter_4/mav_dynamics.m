function [sys, x0, str, ts] = mav_dynamics(t, x, u, flag, MAV)
%SECOND_ORDER_M Simulink function 
    
    switch flag
        case 0
            [sys, x0, str, ts] = mdlInitializeSizes(MAV);
        case 1
            sys = mdlDerivatives(t, x, u, MAV);
        case 2
            sys = mdlUpdate(t, x, u);
        case 3
            sys = mdlOutputs(t, x, u);
        otherwise
            sys = [];
    end      
end

