clear
close all
clc;

drawPendulum([0, 2*pi/7, 5])

drawPendulum([0, 2*pi/3, 5])

for angle = 0:0.1:2*pi
    drawPendulum([0, angle, 5])
    pause(0.1)
end

function handle = drawBase(y, width, height, gap, handle, mode) 
x = [y-width/2, y+width/2, y+width/2, y-width/2];
y = [gap, gap, gap+height, gap+height];

if isempty(handle)
    handle = fill(x, y, 'm');
else
    set(handle, 'XData', x, 'YData', y)
end
end
function handle = drawRod(y, theta, L, gap, height, handle, mode)
x = [y, y+L*sin(theta)];
y = [gap+height, gap+height + L*cos(theta)];
if isempty(handle)
    handle = plot(x, y, 'g')
else
    set(handle, 'XData', x, 'YData', y)
end
end


function drawPendulum(u)

y = u(1);
theta = u(2);
t = u(3);

L = 1;
gap = 0.01;
width = 1.0;
height = 0.1;

persistent base_handle
persistent rod_handle
    track_width=3;

if t == 0
    figure(1), clf
    plot([-track_width, track_width], [0,0], 'k');
    
    %
    hold on

    base_handle = drawBase(y, width, height, gap, [], 'normal');
    rod_handle = drawRod(y, theta, L, gap, height, [], 'normal');
    axis([-track_width, track_width, -L, 2*track_width- L]);

else

    drawBase(y, width,height, gap, base_handle);
    hold on
    drawRod(y, theta, L, gap, height, rod_handle);
    axis([-track_width, track_width, -L, 2*track_width- L]);

    hold off
end
end

