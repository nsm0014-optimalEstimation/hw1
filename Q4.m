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

r = linspace(0,1.9,50);
r_test = zeros(1, length(r));
tests = zeros(1,1000);
rand_rolls = @()sum(V(randperm(numel(V), 2)));

for j = 1:length(r)
    for q = 1:500
        y_n = rand_rolls();
        for i = 2:500
            y_n = (1-r(j))*y_n+r(j)*rand_rolls();
        end
        tests(q) = y_n;
    end
r_test(j) = var(tests);
end


stem_x1 = r;
stem_y1 = r_test;
%% Plotting
fig1 = figure('Position',[500 500 800 400]);
title(sprintf('PDF Mean: %0.5g \t\t\t PDF STD: %0.5g',con_avg,con_std))
xlabel('Outcome','FontSize',16)
ylabel('Probability','FontSize',16)
hold on
stem(stem_x,stem_y)
plot(plot_x,plot_y,LineWidth=2);
saveas(fig1,sprintf('Q4_%s.png','a'))

fig2 = figure('Position',[500 500 800 400]);
xlabel('Roll','FontSize',16)
ylabel('Variance','FontSize',16)
hold on
stem(stem_x1,stem_y1)
xlim([0 1.9])
saveas(fig2,sprintf('Q4_%s.png','c'))