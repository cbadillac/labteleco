
%% Parametros
Zo = 75;
Zl = 50;
Z3 = 0;

%% A resolver
syms Z1 Z2;

[R1, R2] = solve(...
                Zl == Z2.*(Z3+Zo) ./(Z2+Z3+Zo) + Z1, ...
                Zo == Z2.*(Z1+Zl) ./(Z1+Z2+Zl) + Z3, ...
                Z1, Z2);

R1
R2


%% My System
%R2 = solve(Zo - Z2.*(Zo-Zl) == (Z2.*(Zl-Zo) -Zo.*Zl)/(Zo-Z2));
%R1 = Zo - R2/(Zo -Zl);


