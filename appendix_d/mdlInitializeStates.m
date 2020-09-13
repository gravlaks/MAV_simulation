function [sys, x0, str, ts] = mdlInitializeStates(inputArg1,inputArg2)
%MDLINITIALIZESTATES 

    sizes = simsizes;
    sizes.NumContStates = 2; %number of contiunous states
    sizes.NumDiscStates = 0; %number of discrete states
    sizes.NumOutputs = 1; %number of outputs (y = ...)
    sizes.NumInputs = 1; %number of u
    sizes.DirFeedThrough = 0;
    sizes.NumSampleTimes = 1;
    sys = simSizes(sizes);
    
    x0 = [0;0];
    str = []; %str is always an empty matrix
    ts = [0 0]; %continuous sample time
end

