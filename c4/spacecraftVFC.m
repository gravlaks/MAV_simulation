function [vertices, faces, patchColors] = spacecraftVFC
%SPACECRAFTVFC Define vertices, colors for spacecraft

    vertices = [
        1     1    0;  %point 1
        1    -1    0;  %point 2
       -1    -1    0;  %point 3
       -1     1    0;  %point 4
        1     1   -2;  %point 5
        1    -1   -2;  %point 6
       -1    -1   -2;  %point 7
       -1     1   -2;  %point 8
        1.5   1.5  0;  %point 9
        1.5  -1.5  0;  %point 10
       -1.5  -1.5  0;  %point 11
       -1.5   1.5  0;  %point 12
   ];
   faces = [
       1    2   6   5;  %front
       4    3   7   8;  %back
       1    5   8   4;  %right
       2    6   7   3;  %left
       5    6   7   8;  %top
       9    10  11  12; %bottom
       ];
   
   red = [1 0   0];
   green = [0 1 0];
   blue = [0 0 1];
   yellow = [1 1 0];
   cyan = [0 1 1];
   
   patchColors = [
       red; %front
       green; %back
       blue; %right
       yellow; %left
       cyan; %top 
       cyan; %bottom
   ];
end

