%% Formatting
clc
clear
close all
format shortg
%% Begin Question 4
V = [-2.5 -1.5 -0.5 0.5 1.5 2.5];

d1 = (1/6).*ones(1,6);
d2 = d1;
con = conv(d1,d2);

range = linspace(-5,5,11);

con_avg = sum(con*range')
con_var = sum(con*(range.^2)')
con_std = sqrt(con_var)

stem_x = linspace(-5,5,11);
stem_y = con;

plot_x = linspace(-5,5,101);
plot_y = (1/(con_std*(2*pi)^0.5)).*exp(-0.5.*(((plot_x-con_avg)./con_std).^2));


%% Plotting
fig1 = figure('Position',[500 500 800 400]);
title(sprintf('PDF Mean: %0.5g \t\t\t PDF STD: %0.5g',con_avg,con_std))
xlabel('Outcome','FontSize',16)
ylabel('Probability','FontSize',16)
hold on
stem(stem_x,stem_y)
plot(plot_x,plot_y,LineWidth=2);
saveas(fig1,sprintf('Q4_%s.png','a'))