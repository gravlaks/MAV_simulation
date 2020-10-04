function [vertices, faces, colors] = spacecraft_params
%SPACECRAFT_VERTICES Define coordinates of vertices
fuse_l1 = 80;
fuse_l2 = 40;
fuse_h = 40;
wing_l = 40;
fuse_l3 = 120;
tail_h = 80;
tailwing_l = 40;

fuse_w = 40;
wing_w = 120;
tailwing_w = 80;

% Vertices as defined in fig 2.14 p.26, body frame
vertices = [
        fuse_l1     0    0;  %point 1
        fuse_l2    fuse_w/2    -fuse_h/2;  %point 2
        fuse_l2    -fuse_w/2    -fuse_h/2;  %point 3
        fuse_l2    -fuse_w/2    fuse_h/2;  %point 4
        fuse_l2    fuse_w/2    fuse_h/2;  %point 5
        -fuse_l3    0   0;  %point 6
       0    wing_w/2   0;  %point 7
       -wing_l    wing_w/2   0;  %point 8
       -wing_l    -wing_w/2   0;  %point 9
       0    -wing_w/2   0;  %point 10
       -(fuse_l3-tailwing_l)  tailwing_w/2  0;  %point 11
       -(fuse_l3)  tailwing_w/2  0;  %point 12  
       -(fuse_l3)  -tailwing_w/2  0;  %point 13
       -(fuse_l3-tailwing_l)  -tailwing_w/2  0;  %point 14
       -(fuse_l3-tailwing_l) 0 0; %point 15;
       -(fuse_l3) 0 -tail_h;
       ];
   
faces = [
    %nose
    1 4 5 NaN;
    1 4 3 NaN;
    1 3 2 NaN;
    1 2 5 NaN;
    
    %body
    2 3 6 NaN;
    3 4 6 NaN;
    4 6 5 NaN;
    5 6 2 NaN;
    
    %wing
    7 8 9 10;
    
    %tail
    11 12 13 14;
    6 15 16 NaN;
    ];

   red = [1 0   0];
   green = [0 1 0];
   blue = [0 0 1];
   yellow = [1 1 0];
   cyan = [0 1 1];
   
   colors = [
       
       %nose
       red; 
       green; 
       blue; 
       yellow; 
       
       %body
       red; 
       green; 
       blue; 
       yellow; 
       
       %wing
       cyan;
       
       %tail
       cyan;
       cyan;
   ];

    

end

