m=10.0; %mass in kg
l=1.0; %length of stick in m
g=9.8; %acceleration due to gravity in m/s^2

F0=10; %Amplitude of force in N

t_i = 0.0; %initial time for plot
t_f = 60.0; %Final time for plot
timerange = [t_i,t_f]; %time range for plot

%Initial conditions:

p_i = [0,0];  %For theta and Theta dot

%y1=theta --- y2=dy1/dt --- dy2/dt=(F0/(2*l*m))*Cos(y2*t)-m*g*l*sin(y1).

%Setting the constants:
c1=F0/(2*l*m);
c2=-m*g*l;

%Writing the function for the ODE solver:
f=@(t,y)[y(2);c1*cos(y(2)*t)+c2*sin(y(1))];

%Solving the ODE using ODE45:
[T , Y]=ode45(f,timerange,p_i);

%Plotting the phase diagram
figure(1);
plot(Y(:,1),Y(:,2));xlabel('theta');ylabel('theta dot'); title('Phase Plane');

