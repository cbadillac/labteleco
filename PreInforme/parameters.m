
%% Parametros
Zi = 75;
Zo = 50;

%% A resolver modelo "L"
syms Z2 Z3;
Z1 = 0;

[R1, R2] = solve(...
                Zi == Z2.*(Z3+Zo) ./(Z2+Z3+Zo) + Z1, ...
                Zo == Z2.*(Z1+Zi) ./(Z1+Z2+Zi) + Z3, ...
                Z2, Z3);

R1
R2


