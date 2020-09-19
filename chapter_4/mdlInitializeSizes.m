function [sys, x0, str, ts] = mdlInitializeSizes(MAV)
%MDLINITIALIZESTATES 

    sizes = simsizes;
    sizes.NumContStates = 12; %number of contiunous states
    sizes.NumDiscStates = 0; %number of discrete states
    sizes.NumOutputs = 12; %number of outputs (y = ...)
    sizes.NumInputs = 6; %number of u
    sizes.DirFeedthrough = 0;
    sizes.NumSampleTimes = 1;
    sys = simsizes(sizes);
    
    x0 = [
        MAV.pn0;
        MAV.pe0;
        MAV.pd0;
        MAV.u0;
        MAV.v0;
        MAV.w0;
        MAV.phi0; %Should be replaced by quaternions.
        MAV.theta0;
        MAV.psi0;
        MAV.p0;
        MAV.q0;
        MAV.r0;
        ];
    str = []; %str is always an empty matrix
    ts = [0 0]; %continuous sample time
simStateCompliance = 'UnknownSimState';

end

