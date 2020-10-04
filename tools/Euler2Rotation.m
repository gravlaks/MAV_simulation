function R = Euler2Rotation(phi, theta, psi)
    % rotation is body to inertial frame
    R_roll = [
        1   0               0;
        0   cos(phi)    sin(phi);
        0   -sin(phi)    cos(phi)];
    
    R_pitch = [
        cos(theta)  0   -sin(theta);
        0           1           0;
        sin(theta) 0   cos(theta)];
    
    R_yaw = [
        cos(psi)    sin(psi)   0;
        -sin(psi)    cos(psi)    0;
        0           0           1];
    
    R = (R_roll*R_pitch*R_yaw)'; %obtaining a left handed rotation.

end