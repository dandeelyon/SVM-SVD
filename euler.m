function euler(func,y0,dt,t0,tf)
%time interval
t=t0:dt:tf;
%initial y
y(1)=y0;
%loop using euler
for i=1:length(t)-1
    y(i+1)= y(i)+dt*(feval(func,t(i),y(i)));
end
%print vectors
t=t'
y=y'
plot(t,y)
xlabel('time')
ylabel('y')