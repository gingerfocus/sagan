clear
close all
clc

%% Part 1: Solving system of equations
syms a b c d

r1 = 1e3;
r2 = 1e3;
r3 = 2e3;
r4 = 1e3;

vs1 = 6;
vs2 = 12;

is1 = 6e-3;
is2 = 4e-3;
is3 = 6e-3;


eq1 = ( (a - b) / (r1) ) - is1 + ( (a - d) / (r2) ) - is3 == 0;
eq2 = ( (b - a) / (r1) ) + is1 - ( (d - a) / (r2) ) + (b / r3) + is2 + (d / r4) == 0;
eq3 = b - c == vs1;
eq4 = d - c == vs2;

eqns = [eq1, eq2, eq3, eq4];
vars = [a, b, c, d];

results = solve(eqns, vars); % stores solution in a results structure
a = double(results.a)
b = double(results.b)
c = double(results.c)
d = double(results.d)

%% Part 2: Solving again with new constants
clear
syms a b c d

r1 = 1e3;
r2 = 2e3;
r3 = 3e3;
r4 = 4e3;

vs1 = 12;
vs2 = 24;

is1 = 4e-3;
is2 = 8e-3;
is3 = 12e-3;

eq1 = ( (a - b) / (r1) ) - is1 + ( (a - d) / (r2) ) - is3 == 0;
eq2 = ( (b - a) / (r1) ) + is1 - ( (d - a) / (r2) ) + (b / r3) + is2 + (d / r4) == 0;
eq3 = b - c == vs1;
eq4 = d - c == vs2;

eqns = [eq1, eq2, eq3, eq4];
vars = [a, b, c, d];

results = solve(eqns, vars); % stores solution in a results structure
a = double(results.a)
b = double(results.b)
c = double(results.c)
d = double(results.d)
