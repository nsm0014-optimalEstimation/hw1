%% Formatting
clc
clear
close all
format shortg
%% Begin Question 5
P_x = [2 1;1 4];

[ev,eigP_x] = eig(P_x)
th = atand(P_x(2,1)/(P_x(1,1)-P_x(2,2)))*(0.5)
A = eigP_x^-0.5*ev
theta = linspace(0,360,361);
a = [cosd(theta);sind(theta)];
a2 = 0.25*a;
a3 = 1.5*a;

b = A\a;
b2 = A\a2;
b3 = A\a3;
fig1 = figure;
hold on
xlim([-4 4])
ylim([-4 4])
plot(b(1,:),b(2,:),LineWidth=2)
plot(b2(1,:),b2(2,:),LineWidth=2)
plot(b3(1,:),b3(2,:),LineWidth=2)
plot(b3(1,:)*sind(th)*4,b3(1,:)*cosd(th+90)*4)
plot(b3(1,:)*sind(th)*4,-b3(1,:)*cosd(67.5)*4)
legend('c = 0.25','c = 1','c = 1.5','Location','bestoutside','Orientation','horizontal',fontsize=14)
saveas(fig1,"Q6_c.png")


