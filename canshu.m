clc
clear all
%�������
UN=220;
IdN=1.1;
nN=1600;
Ce=0.145;
lambda=2;
R=6;
Tl=0.042;%���ʱ�䳣��
Tm=0.08;%����ʱ�䳣��

%PWM�任������
Ts=0.00036;%ʧ��ʱ��
f=1/Ts;%PWM�任������Ƶ��
Ks=41.8103;
Ucm=5.3095238;%�����Ƶ�ѹ���ٶ�
Udc=Ks*Ucm;%ֱ����Դ��ѹ

Toi=0.002;%�������˲�ʱ�䳣��

Ton=0.01;%ת�ٻ��˲�ʱ�䳣��

Un=10;%�ת�ٸ�����ѹ

Uonl=8;%ת�ٵ���������޷�
Uoil=8;%��������������޷�

alpha=0.05;%ת�ٷ���ϵ��
beta=4.2;%��������ϵ��

%����������
Tsigmai=0.0037;%������Сʱ�䳣��֮��
taui=Tl;
KI=0.5/Tsigmai;%KI=135.1
Ki=(KI*taui*R)/(Ks*beta);%Ki=5

%ת�ٵ�����
Tsigman=0.0174;%ת�ٻ�Сʱ�䳣��
% Tsigman=2*Tsigmai+Ton;
h=5;%��Ƶ����һ��ѡ��5
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