function  handle = drawSpacecraftBody(pn, pe, pd, phi, theta, psi, handle, mode)
%DRAWSPACECRAFTBODY Draw spacecraft
NED = spacecraftPoints;
NED = rotate(NED, phi, theta, psi);
NED = translate(NED, pn, pe, pd);

R = [
    0 1 0;
    1 0 0;
    0 0 -1];

XYZ = R*NED;
if isempty(handle)
    handle = plot3(XYZ(1,:), XYZ(2,:), XYZ(3, :));
else
    set(handle, 'XData', XYZ(1, :), 'YData', XYZ(2,:), 'ZData', XYZ(3, :));
    drawnow;

end

