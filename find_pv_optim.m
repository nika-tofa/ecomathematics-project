function [pv, pv_vect, Volume_forest, harvesting_strategy] = find_pv_optim(Tper, par)

% parameters
mu_r = par(1);
sigma_r = par(2);
K = par(3);
gamma = par(4);
V_r = par(5);
p = par(6);
c = par(7);
delta = par(8);
T = par(9);
beta=par(11);

h = zeros(1,T+1);
V = zeros(1,T+1);
PV_arr = zeros(1,T+1);
g = zeros(1,T+1);

V(1)= par(10); %initial volume
g(1)= par(10);

counter=0; %needed to define the b_i function in the loop

for t = 2:T+1
    r=normrnd(mu_r,sigma_r); %generate growth rate for the current year
    g(t) = V(t-1) + r*V(t-1)*(1-V(t-1)/K) - beta*(V(t-1) + r*V(t-1)*(1-V(t-1)/K)); %growth-natural death either
   
    counter=(counter +(rem(t-1,Tper)==0)); % = 0 xor 1 xor 2 xor 3
    h(t) = (rem(t-1,Tper)==0)*(g(t)*gamma*(counter==1) + (g(t)-V_r)*(counter==2));
    counter= counter*(counter<2);
    
    V(t) = g(t)-h(t);
    
    PV_arr(t) = (p*h(t)-(rem(t-1,Tper)==0)*c)/(1+delta)^(t-1); % for the array of profits    
end

pv = sum(PV_arr); 
pv_vect=PV_arr;
Volume_forest=V;
harvesting_strategy=h;
end
