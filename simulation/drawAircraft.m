function drawAircraft(u)
%DRAWAIRCRAFT 
    pn = u(1);
    pe = u(2);
    pd = u(3);
    quat = u(7:10)';
    t = u(14);
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
        spacecraft_handle = drawSpacecraftBody(pn, pe, pd, quat, []);
    else
        drawSpacecraftBody(pn,pe,pd, quat, spacecraft_handle);
    end
end

