%% Formatting
clc
clear
close all
format shortg
%% Begin Question 1

% Defining dice
a = (1/6).*[0 1 1 1 1 1 1];
b = [0 0, 0, a];
c = (1/6).*[0 2 0 3 0 1];
d1 = a; d2 = c;

% Defining cases for each problem
parta = [a; a; a; a; a; a];
partb = [b; b; b; b; b; b];
partc = [c; c; c; c; c; c];
partd = {d1, d1, d1, d2, d2, d2};

aCon = conv(parta(1,:), parta(2,:));
bCon = conv(partb(1,:), partb(2,:));
cCon = conv(partc(1,:), partc(2,:));
dCon = conv(partd{1}, partd{2});

for i = 3:6
    aCon = conv(aCon, parta(i,:));
    bCon = conv(bCon, partb(i,:));
    cCon = conv(cCon ,partc(i,:));
    dCon = conv(dCon, partd{i});
end

conv_ = {aCon, bCon, cCon, dCon};
parts = ['a','b','c','d'];
for i = 1:length(conv_)
    % finding mean and std for each case
    conv_mean = (0:length(conv_{i})-1)*conv_{i}';
    conv_var = ((0:length(conv_{i})-1)-conv_mean).^2 * conv_{i}';
    conv_sig = conv_var^0.5;
    
    % plotting
    fig1 = figure('Position',[500 500 800 400]);
    hold on
    ylabel('Probability','FontSize',16)
    xlabel('Outcome','FontSize',16)
    title(sprintf('PDF Mean: %0.5g \t\t\t PDF STD: %0.5g',conv_mean,conv_sig))
    stem(0:length(conv_{i})-1,conv_{i})
    x = 0:0.1:length(conv_{i});
    y = (1/(conv_sig*(2*pi)^0.5)).*exp(-0.5.*((x-conv_mean)./conv_sig).^2);
    plot(x, y)
    saveas(fig1,sprintf('Q1_%s.png',parts(i)))
end