clear all; 
close all;
clc;

%% Task

% parameters
A = 100;    % total area of the forest
K = 90*A;   % the carrying capacity of the forest, [m^3]
T = 91;     % total planning period time.
mu = 0.15;  % lower boundary for distribution
sigma = 0.05; % upper boundary for distribution
beta = 0.01;  % dying rate per year
p = 30;       % selling price
c = 800*A;    % cost of the harvest, [MU]
gamma = 0.4;  % harvesting rate
V_r = 10*A;   % volume of timber that gets replanted [m^3]
delta = 0.03; % discount rate
V0 = 10*A;    % initial timber volume = is 10^4 [m^3], since we start planning
              % from a clear cut of the forest, and after each clear cut we plant 10m^3/ha timbers

parameters = [mu, sigma, K, gamma, V_r, p, c, delta, T,  V0, beta];

% The task is to find optimal thinning period length Tper

Nsimul=500;
Tper_attempts=30;

for n=1:Nsimul
pres_values=zeros(1, Tper_attempts); % store for all the incomes of the possible Tper choices
for tp=1:Tper_attempts
    [pv, ~, ~,~ ] = find_pv_optim(tp, parameters);
pres_values(tp)=pv;
end
   [~,T_per_opt(n)]= max(pres_values);
end

Tper_avg=round(mean(T_per_opt));
   [pv, pv_vect, Volume_forest, harvesting_strategy] = find_pv_optim(Tper_avg, parameters);
 
        
   figure
   subplot(1,3,1)
       hold on
    str=sprintf('Tper=%0.2f', Tper_avg);
    title (str);
        plot ([1:T+1], Volume_forest);
        xlabel('time');
        ylabel('Volume of the forest');
    subplot(1,3,2)
        plot ([1:T+1], cumsum(pv_vect));
        xlabel('time');
        ylabel('cumulative present value');
    subplot(1,3,3)
       plot ([1:T+1], harvesting_strategy );
       xlabel('time');
       ylabel('Harvesting strategy');