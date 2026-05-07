%% ECEN 110L, Linear Systems Lab 5

syms s
H = 16 / ( s^2 + 4s + 16 )
h = ilaplace(H)
