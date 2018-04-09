function [pcData] = show3d(DataRoot,LaserRoot,Index,L)

imgtime = GetImageTime(Index,DataRoot);
recpcData = GeneralRecHDLFun(LaserRoot,imgtime,L);
pcData = recpcData{1}';

x = pcData(:, 1);
y = pcData(:, 2);
z = pcData(:, 3);

plot3(x,y,z, '.b'); axis equal; grid on;hold on;
% view(2);