clc
clear all
%电机参数
UN=220;
IdN=1.1;
nN=1600;
Ce=0.145;
lambda=2;
R=6;
Tl=0.042;%电磁时间常数
Tm=0.08;%机电时间常数

%PWM变换器参数
Ts=0.00036;%失控时间
f=1/Ts;%PWM变换器开关频率
Ks=41.8103;
Ucm=5.3095238;%最大控制电压，假定
Udc=Ks*Ucm;%直流电源电压

Toi=0.002;%电流环滤波时间常数

Ton=0.01;%转速环滤波时间常数

Un=10;%额定转速给定电压

Uonl=8;%转速调节器输出限幅
Uoil=8;%电流调节器输出限幅

alpha=0.05;%转速反馈系数
beta=4.2;%电流反馈系数

%电流调节器
Tsigmai=0.0037;%电流环小时间常数之和
taui=Tl;
KI=0.5/Tsigmai;%KI=135.1
Ki=(KI*taui*R)/(Ks*beta);%Ki=5

%转速调节器
Tsigman=0.0174;%转速环小时间常数
% Tsigman=2*Tsigmai+Ton;
h=5;%中频带宽，一般选择5
taun=h*Tsigman;
KN=(h+1)/(2*h*h*Tsigman*Tsigman);%KN=396.4
Kn=(h+1)*beta*Ce*Tm/(2*h*alpha*R*Tsigman);%Kn=7.7s^(-1)
L = (Udc/(2*Ce))/(pi/Ts);
n=2000;
K=200;
T=0.751;
T0=0.136;
GD2 = K * (T - T0) / n;
SS=IdN*Ks*UN*Ce*Tm;
SS2=Tl/Tm;
TS=105.48;
CM=9.55*Ce;