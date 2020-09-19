function drawAircraft(u)
%DRAWAIRCRAFT 
    pn = u(1);
    pe = u(2);
    pd = u(3);
    phi = u(7);
    theta = u(8);
    psi = u(9);
    t = u(13);
    persistent spacecraft_handle;
    if t == 0
        figure(1), clf
        axis vis3d equal;
        view([135 30]);
        xlim([-1000,1000]);
        ylim([-1000,1000]);
        zlim([-1000,1000]);
        xlabel('x');
        ylabel('y');
        zlabel('z');
        grid on 
        camlight;
        hold on
        spacecraft_handle = drawSpacecraftBody(pn, pe, pd, phi, theta, psi, []);
    else
        drawSpacecraftBody(pn,pe,pd,phi,theta,psi, spacecraft_handle);
    end
end

