function XYZ= translate(XYZ, pn, pe, pd)
%TRANSLATE 

XYZ = XYZ + repmat([pn;pe;pd], 1, size(XYZ,2));

end

