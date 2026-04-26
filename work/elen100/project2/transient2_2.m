function F=transient2_2(t,x)

F=[0;0;0];

R1=5e3; R2=5e3; R3=400; R4=1e3; R5=1e3;

if (t>=0) && (t<=1e-6)
    h=1e6*t;
else
    h=1;
end
% h(t) represents an approximation of the step function,
% with a rise time of 1 microsecond.

F(1)=((-1/R1)+(-1/R2)+(-1/R3))*x(2)+(1/R3)*x(3)+(h/R1);
F(2)=(1/R3)*x(2)+(-1/R3)*x(3);
F(3)=(1/R4+1/R5)*x(3)+(-1/R4)*x(1);
end