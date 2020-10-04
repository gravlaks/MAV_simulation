function handle= drawSpacecraftBody(pn, pe, pd, quat, handle)
%DRAWSPACECRAFTBODY draw spacecraft or create handle
    [vertices, faces, colors] = spacecraft_params;
    
    vertices = rotate(vertices', quat)';
    vertices = translate(vertices', pn, pe, pd)';

    R = [
        0 1 0;
        1 0 0;
        0 0 -1;
        ];
    vertices = vertices*R; %translate from ned to matlab xyz
    if isempty(handle)

        handle = patch('Vertices', vertices, 'Faces', faces, 'FaceVertexCData', colors, 'FaceColor', 'flat');
    else
        
        set(handle, 'Vertices', vertices, 'Faces', faces);
        drawnow;
    end
end

