clear

syms t s

Vg = heaviside(t-1);

Vmas=laplace(Vg,t,s)/2;       %V+

R=1e3;
C=2e-3;

a=R;
b=1/(s*C);

Zo=50;

serie = a + b;
paralelo = a*b/(a+b);

Zl=serie;             %Impedancia de la carga


G=(Zl-Zo)/(Zl+Zo);          %gamma_L

a=0;                     %Constante de atenuacion
v=8.1;                      %Velocidad de fase
d=10;                       %Largo de la linea


V=Vmas*(1+G*exp(-2*d*s/v)*exp(-2*d*a));

W = ilaplace(V);
t2 = 0:0.001:5;

plot(t2,double(subs(W,t,t2)),'LineWidth', 1.5,'color','b')

grid on
