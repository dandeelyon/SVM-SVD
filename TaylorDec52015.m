%%Maclaurin Series without the taylor function incorporated into Matlab.
% If F(x)=sin(x)       F(0)=0
% If F'(x)=cos(x)      F'(0)=1
% If F''(x)=-sin(x)    F''(0)=0
% If F'''(x)=-cos(x)   F'''(0)=-1
% If F''''(x)=sin(x)   F''''(0)=0
% If F'''''(x)= cos(x) F'''''(0)=1

%Taylors series around x=0 is called MacLaurin series expansion
%Set up functions
syms x
f=sin(x)
t1= 0+(1/factorial(1))*x
t3= x-(x^3)/factorial(3)
t5= x-(x^3)/factorial(3)+(x^5)/factorial(5)

%plot initial function
ezplot(f)
hold on
%plot the 1st, 3rd, and 5th order terms.
ezplot(t1)
ezplot(t3)
ezplot(t5)
%create plot limits
xlim([-4 4])
ylim([-2 2])
%legend and title
legend('sin x','first order approximation','third order approximation', 'fifth order approximation')
title('How approximation works')