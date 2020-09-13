close all;
clear;
clc;
spacecraft_handle = drawSpacecraftBody(0,0, 0, 0, 0, 0, []);

drawSpacecraftBody(0,0,0,0,0,0,spacecraft_handle);
xlim([-3,3])
ylim([-3,3])
zlim([-3,3])
for psi = 0:0.1:2*pi
    drawSpacecraftBody(0,0,0,-pi/4,0,psi, spacecraft_handle);
    pause(0.1);
end