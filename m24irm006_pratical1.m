t= 0:0.01:3;
th_0= 0;
th_T= deg2rad(120);
T=3;
l=1;
m=1;
l=1
lc = 0.5;
Izz = (m*l*l)/3;
g=9.81;
%position,velocity,acceleration(a)
th_des= th_0 + (th_T -th_0)/T *(t-(T/(2*pi))*sin(2*pi*t/T));
plot(t,th_des)
Y=(th_T - th_0)/T
th_des2 = Y*(1-cos(2*pi*t/T));
th_des3 = Y*(2*pi/T*sin(2*pi*t/T));
figure(1)
plot(t,th_des,t,th_des2,t,th_des3)
grid on
xlabel('time(sec)')
ylabel('\theta_{desired}')
legend('theta','theta dot','theta double dot')
%end factor(b)
x1 = l*cos(th_des);
y1 = l*sin(th_des);
x1d =-l*sin(th_des).*th_des2;
y1d = l*cos(th_des).*th_des2;
x1dd = -l*cos(th_des).*th_des2.^2 -l*sin(th_des).*th_des3;
y1dd = l*cos(th_des).*th_des3 - l*sin(th_des).*th_des2.^2;
figure(2)
plot(t,x1d,t,y1d, t,x1dd,t,y1dd)
grid on
xlabel('time(sec)')
ylabel('velocity and accelearation')
tau = Izz*th_des3 + m*g*lc*cos(th_des);
figure(3)
plot(t,tau)
grid on
xlabel('time(sec)')
ylabel('Torque')
p=[];
q=[];
for i =1:length(t)
    x =x1(i);
    y= y1(i);
    X=[0 x];
    Y=[0 y];
     p=[p x];
    q=[q y];
    figure(4)
plot(X,Y,x,y,p,q,'LineWidth',3)
%hold on 
%plot(p,q,'LineWidth' ,3)
axis([-1.5 1.5 -1.5 1.5])
pause(0.03)
end
%%sectionD(Trace)

%for i=1:length(t)
 %   x=x1(i);
  %  y=y1(i);
   % p=[p x];
    %q=[q y];
    %X=[0 x];
    %Y =[0,y];
    %figure(5)
   % plot(p,q,'LineWidth' ,3)
    %axis([-1.5 1.5 -1.5 1.5])
    %pause(0.01)
%end
