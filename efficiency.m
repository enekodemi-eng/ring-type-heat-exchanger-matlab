clear all
close all 
clc

%% Define parameters
NIA=21;
m_c=1.4;
T_ce=55+NIA;
m_f=2.54;
T_fe=20;
k_acero=20;
L=5;
Pasos=10;
e_tuberia=0.003;
e_oxido=0.001;
k_oxido=4;
D3=(0.08-(NIA/1000));
D2=D3-e_oxido*2;
D4=D3+e_tuberia*2;
D6=0.08+(NIA/1000);
Dh_f=D6-D4;
At_f=(pi/4)*(D6^2-D4^2);
At_c=(pi/4)*D2^2;
A_e=pi*D4*Pasos*L;

%% Calculation of T_fs y T_cs


T_fs=0;
T5=(T_fs+T_fe)/2;
[cp_f]=cp_agua(T5);
[cp_c]=cp_agua(T_ce);
T_fsnueva=40;


while abs(T_fs-T_fsnueva) > 0.01
T_fs=T_fsnueva;
T_cs=T_ce-(((T_fs-T_fe)*m_f*cp_f)/(m_c*cp_c));
Text=0;
Tint=0;
Tint_nueva=70;
Text_nueva=30;
    while abs(Tint-Tint_nueva) > 0.01 || abs(Text-Text_nueva)> 0.01
    Text=Text_nueva;
    Tint=Tint_nueva;

    %% Calculation of h_f suponiendo T_fs y T4
    T5=(T_fs+T_fe)/2;

    [densidad_f]=d_agua(T5);
    [cp_f]=cp_agua(T5);
    [k_f]=k_agua(T5);
    [mu_f]=mu_agua(T5);
    [mu_supext]=mu_agua(Text);
    [Pr_f]=Pr_agua(T5);
    V_f=m_f/(At_f*densidad_f);
    Re_f=(densidad_f*Dh_f*V_f)/mu_f;
    if Re_f < 10000
        Nu_f=1.86*((Dh_f/L)*Re_f*Pr_f)^(1/3)*(mu_f/mu_supext)^0.14;
    else
        Nu_f=0.027*Re_f^0.8*(Pr_f^(1/3))*(mu_f/mu_supext)^0.14;
    end
    h_f=(Nu_f*k_f)/Dh_f;

    %% Calculation of h_c obtainig T_cs y assuming T2/T3

    T1=(T_cs+T_ce)/2;

    [densidad_c]=d_agua(T1);
    [cp_c]=cp_agua(T1);
    [k_c]=k_agua(T1);
    [mu_c]=mu_agua(T1);
    [mu_supint]=mu_agua(Tint);
    [Pr_c]=Pr_agua(T1);
    V_c=m_c/(At_c*densidad_c);
    Re_c=(densidad_c*D2*V_c)/mu_c;
    if Re_c < 10000
        Nu_c=1.86*((D2/L)*Re_c*Pr_c)^(1/3)*(mu_c/mu_supint)^0.14;
    else
        Nu_c=0.027*Re_c^0.8*(Pr_c^(1/3))*(mu_c/mu_supint)^0.14;
    end
    h_c=(Nu_c*k_c)/D2;

    %% Calculation of U_ext

    lognep_ox=log(D3/D2);
    lognep_acero=log(D4/D3);
    U_ext=((D4/(D2*h_c))+(D4*lognep_ox)/(2*k_oxido)+(D4*lognep_acero)/(2*k_acero)+(1/h_f))^-1;
    Tint_nueva=T1-((U_ext*D4*(T1-T5))/(D2*h_c));
    Text_nueva=(U_ext/h_f)*(T1-T5)+T5;
    end
    if m_c*cp_c > m_f*cp_f
    mcpmin=m_f*cp_f;
    NTU=(U_ext*A_e)/(m_f*cp_f);
    Cr=(m_f*cp_f)/(m_c*cp_c);
    E=(1-exp(-(1-Cr)*NTU))/(1-Cr*exp(-(1-Cr)*NTU));
    T_fsnueva=(E*(T_ce-T_fe))+T_fe;
    else 
    mcpmin=m_c*cp_c;
    NTU=(U_ext*A_e)/(m_c*cp_c);
    Cr=(m_c*cp_c)/(m_f*cp_f);
    E=(1-exp(-(1-Cr)*NTU))/(1-Cr*exp(-(1-Cr)*NTU));
    T_csnueva=T_ce-(E*(T_ce-T_fe));
    T_fsnueva=T_fe+(((T_ce-T_csnueva)*m_c*cp_c)/(m_f*cp_f));
    end
end
Q=E*mcpmin*(T_ce-T_fe);
