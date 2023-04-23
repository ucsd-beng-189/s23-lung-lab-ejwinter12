%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
i=0;% chose index variable
betavals = 0:0.1:1; %chose beta values
for beta = betavals %over each beta value
    i=i+1; %increase index each iteration
setup_lung 
cvsolve 
outchecklung


PIhold(i) = PI; %hold value of PI at that beta
PAbar(i) = PAbar; %hold value of PI at that beta
Pabar(i) = Pabar; %hold value of PI at that beta
Pv(i) = Pv; %hold value of PI at that beta
end

figure(4) 
hold on; 
plot(betavals, PIhold,'-.','LineWidth',5) %plot variables vs beta
plot(betavals, PAbar,'-.','LineWidth',5)
plot(betavals, Pabar,'-.','LineWidth',5)
plot(betavals, Pv,'-.','LineWidth',5)
xlabel('Beta')
ylabel('values')
title('Variations with Beta')
legend('PI', 'PAbar', 'Pabar', 'Pv');
