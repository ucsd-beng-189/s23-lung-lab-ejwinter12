%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
i=0;% chose index variable
betavals = 0:0.05:1; %chose beta values
Mcoeff = 1;
for beta = betavals %over each beta value
    i=i+1; %increase index each iteration
setup_lung 
cvsolve 
outchecklung

PIhold(i) = PI; %hold value of PI at that beta
PAbarhold(i) = PAbar; %hold value of PI at that beta
Pabarhold(i) = Pabar; %hold value of PI at that beta
Pvhold(i) = Pv; %hold value of PI at that beta
end

figure(4) 
hold on; 
plot(betavals, PIhold,'-.','LineWidth',5) %plot variables vs beta
plot(betavals, PAbarhold,'-.','LineWidth',5)
plot(betavals, Pabarhold,'-.','LineWidth',5)
plot(betavals, Pvhold,'-.','LineWidth',5)
xlabel('Beta')
ylabel('values')
title('Variations with Beta')
legend('PI', 'PAbar', 'Pabar', 'Pv');

%% Task 4 trial and error plot
plot(0:0.2:1,[0.0321,0.0315,0.0308,0.0292,0.0247,0.0176],'.-','MarkerSize',20)
title('maximum oxygen consumption at beta values')
xlabel('beta') %plots maximum concentration vs beta determined by trial and error
ylabel('max oxygen consumption')

