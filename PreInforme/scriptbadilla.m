clear all;
clc
syms t s;
z0 = 75;

R = 10;
C = 0.01;
L = 10;

%%
%%rc paralelo
Z_L_rc_p = R/(s*R*C+1); %%Impedancia ZL
G_L_rc_p = (Z_L_rc_p -75)/(Z_L_rc_p + 75);%Gamma L
%%
%%rc serie
Z_L_rc_s = (R*s*C +1)/(s*C);%%Impedancia ZL
G_L_rc_s = (Z_L_rc_s -75)/(Z_L_rc_s + 75);%Gamma L
%%
%%rL paralelo
Z_L_rL_p = R*s*L/(R +s*L);%%Impedancia ZL
G_L_rL_p = (Z_L_rL_p -75)/(Z_L_rL_p + 75);%Gamma L
%%
%%rL serie
Z_L_rL_s = (R + s*L);%%Impedancia ZL
G_L_rL_s = (Z_L_rL_s -75)/(Z_L_rL_s + 75);%Gamma L
%%
c = 10; %velocidad de la luz
vp = 0.81 * c; %velocidad de fase
L = 10; %largo de la linea
vg = 2/s; % voltaje pulso en laplace
alpha = 0; % constante de atenueacion
vplus = vg/2; % señal insidente
tau = (2*L/vp); % tiempo de ida y vuelta de la señal

gamma_L = G_L_rL_p; % constante de reflexion

v_s = vplus*(1+gamma_L*exp(-tau*s)*exp(-2*alpha*L)); % señal total en laplace

v_t = ilaplace(v_s) %señal total en el tiempo


t_vector = (0:0.01:10);

plot(t_vector,double(subs(v_t,t,t_vector)),'r');
title('Carga RL en paralelo R<Z0');
xlabel('Tiempo[s]');
ylabel('Voltaje[V]');











