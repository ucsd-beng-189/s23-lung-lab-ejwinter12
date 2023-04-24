%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
i=0;% chose index variable
betavals = 0.3; %chose beta values (ventilation-perfusion)
Mcoeff = 1; %change Oxygen consumption
crefcoeffvals = 0.15; %change inspired o2 concentration (eoundabout elevation)
beta = betavals;
cstarcoeff = 1.5;
%for beta = betavals %over each beta value ::canceled for this task
for crefcoeff = crefcoeffvals %over each crefcoeff value
    i=i+1; %increase index each iteration
setup_lung 
cvsolve 
outchecklung

PIhold(i) = PI; %hold value of PI at that crefcoeff
PAbarhold(i) = PAbar; %hold value of PI at that crefcoeff
Pabarhold(i) = Pabar; %hold value of PI at that crefcoeff
Pvhold(i) = Pv; %hold value of PI at that crefcoeff
end
%end
% figure(4) 
% hold on; 
% plot(betavals, PIhold,'-.','LineWidth',5) %plot variables vs beta
% plot(betavals, PAbarhold,'-.','LineWidth',5)
% plot(betavals, Pabarhold,'-.','LineWidth',5)
% plot(betavals, Pvhold,'-.','LineWidth',5)
% xlabel('Beta')
% ylabel('values')
% title('Variations with Beta')
% legend('PI', 'PAbar', 'Pabar', 'Pv');

% figure(5) 
% hold on; 
% plot(crefcoeffvals*0.2/(22.4*(310/273)), PIhold,'-.','LineWidth',5) %plot variables vs cI
% plot(crefcoeffvals*0.2/(22.4*(310/273)), PAbarhold,'-.','LineWidth',5)
% plot(crefcoeffvals*0.2/(22.4*(310/273)), Pabarhold,'-.','LineWidth',5)
% plot(crefcoeffvals*0.2/(22.4*(310/273)), Pvhold,'-.','LineWidth',5)
% xlabel('partial pressure oxygen in inspired air (altitude representation)')
% ylabel('values')
% title('Variations with Altitude')
% legend('PI', 'PAbar', 'Pabar', 'Pv');

figure(6) 
hold on; 
plot(RT*crefcoeffvals*0.2/(22.4*(310/273)), PIhold,'-.','LineWidth',5) %plot variables vs pI
plot(RT*crefcoeffvals*0.2/(22.4*(310/273)), PAbarhold,'-.','LineWidth',5)
plot(RT*crefcoeffvals*0.2/(22.4*(310/273)), Pabarhold,'-.','LineWidth',5)
plot(RT*crefcoeffvals*0.2/(22.4*(310/273)), Pvhold,'-.','LineWidth',5)
xlabel('partial pressure oxygen in inspired air (altitude representation)')
ylabel('values')
title('Variations with Altitude')
legend('PI', 'PAbar', 'Pabar', 'Pv');
%% Task 4 trial and error plot
figure
plot(0:0.2:1,[0.0321,0.0315,0.0308,0.0292,0.0247,0.0176],'.-','MarkerSize',20)
title('maximum oxygen consumption at beta values')
xlabel('beta') %plots maximum concentration vs beta determined by trial and error
ylabel('max oxygen consumption')

