%% formatting
clc
clear
close all
format shortg
%% Begin Question 7
x = -5:0.01:5;
y = 2.*x.^2;
sig = 2;

y1 = (1/(sig*(2*pi)^0.5)).*exp(-0.5.*((x)./sig).^2);
y2 = exp(-y./(4*sig^2))./(abs((y./2).^(1/2))*4*sig*sqrt(2*pi));

fig1 = figure('Position',[500 500 600 400]);
plot(x, y1, 'LineWidth', 2)
hold on
plot(x, y2, 'LineWidth', 2)
legend('f_x(x)', 'f_y(y)','Orientation','horizontal',fontsize=14)
ylim([0,0.5])
saveas(fig1,'Q7_b.png')
