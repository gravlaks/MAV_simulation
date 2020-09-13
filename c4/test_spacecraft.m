%% Example Title
% Summary of example objective


%%Preparation
close all;
clear;
clc;
%% Section 1 Title
% Description of first code block

pn = 0;
pe = 0;
pd = 0;
phi = 0;
theta = pi/4;
psi = 0;


spacecraft_handle = drawSpacecraftBody(0,0,0,0,0,0,[]);
xlim([-3,3])
ylim([-3,3])
zlim([-3,3])
for psi = 0:0.1:2*pi
    drawSpacecraftBody(0,0,0,-pi/4,0,psi, spacecraft_handle);
    pause(0.1);
end