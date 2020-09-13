function drawAircraft(u)
%DRAWAIRCRAFT 
    pn = u(1);
    pe = u(2);
    pd = u(3);
    phi = u(7);
    theta = u(8);
    psi = u(9);
    t = u(7);
    persistent spacecraft_handle;
    if isempty(spacecraft_handle)
        figure(1), clf
        axis vis3d equal;
        view([142.5, 30]);
        camlight;
        hold on
        spacecraft_handle = drawSpacecraftBody(0,0,0,0,0,0,[]);
    else
        drawSpacecraftBody(pn,pe,pd,phi,theta,psi, spacecraft_handle);
    end
end

