function XYZ= rotate(XYZ, quat)
%ROTATE rotate the body with quaternions. rotate all vectors from one
%place to another
    
    
    R = Quaternion2Rotation(quat)'; %obtaining a left handed rotation.
    XYZ = R*XYZ;
end