clc; close all;
global M C K F wdr

M=[9 0;0 1];
C=[2.7 -.3;-.3 .3];
K=[27 -3;-3 3];
F1=0
F2=3
B=[F1 F2]';
wdr=1;

t=0:.01:50;
IC=[.1 0 1 -1]; %x10, x20, v10, v20
[t,x]=ode45(@HW13pt3,t,IC);

plot(t,x(:,1),t,x(:,2))
xlabel('Time (s)')
ylabel('Displacement (m)')
title('HW13 Problem 3')
legend(["Mass 1","Mass 2"])


% %Definitions
% X0=[.1;0]
% V0=[1;-1]
% M_inv=inv(sqrtm(M));
% K_tilde=M_inv*K*M_inv;
% [e_vec, e_val] = eig(K_tilde);
% [Lamda, I] = sort(diag(e_val));
% wn=sqrt(Lamda);
% D=diag(Lamda);
% P=e_vec(:,I);
% U=M_inv*P;
% S=M_inv*P;
% S_inv=inv(S);
% RX0=S_inv*X0;
% RV0=S_inv*V0;
% 
% C_tilde=M_inv*C*M_inv;
% Damp=diag(P'*C_tilde*P);
% z=Damp./(2*sqrt(diag(D)));
% f0=P'*M_inv*B;
% 
% for i = 1:length(M)
%     wd = wn(i)*sqrt(1-z(i)^2)
%     th=atan2(2*z(i)*wn(i)*wdr,wn(i)^2-wdr^2)
%     X=f0(i)/(sqrt((wn(i)^2-wdr^2)^2+(2*z(i)*wn(i)*wdr)^2))
%     phi=atan2(wd*(X0(i)-X*cos(th)),...
%         V0(i)+(X0(i)-X*cos(th))*z(i)*wn(i)-wdr*X*sin(th))
%     A=(X0(i)-X*cos(th))/sin(phi)
%     
%     Xt=A.*exp(-z(i)*wn(i).*t).*sin(wd.*t+phi)
%     Xs=X.*cos(wdr.*t-th);
% 
%     R(i,:)=Xt+Xs;
% end
% 
% X_plot=S*R;
% 
% figure
% plot(t,X_plot(1,:),t,x(:,1))
% legend(["Mass 1","Mass 2"])
% xlabel('Time (s)');
% ylabel('Displacement')
% title('Free Response in Physical Coordinates')


function xdot = HW13pt3(t,x)
    global M C K F wdr
    xdot=[zeros(2,2) eye(2,2); -M\K -M\C]*x ...
        +[0; 0; M\F]*cos(wdr*t);
end
