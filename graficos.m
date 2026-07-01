%% Tcs, Tfs, T2 y T4 vs kóxido graph
vector_ejex=[2,2.5,3,3.5,4];
vector_ejeyTcs=[41.58,40.20,39.23,38.50,37.94];
vector_ejeyTfs=[38.99 ,39.75,40.29,40.69,40.99];
vector_ejeyT2=[51.58,50.52,49.76,49.19,48.75];
vector_ejeyT4=[37.06 ,37.73,38.21,38.57,38.84];

figure(1)
plot(vector_ejex,vector_ejeyTcs,vector_ejex,vector_ejeyTfs,vector_ejex,vector_ejeyT2,vector_ejex,vector_ejeyT4,'LineWidth',1)
ylabel('T[°C]') % Concepts and units
xlabel('kóxido[W/m^2*K]') % Concepts and units
title('Tcs, Tfs, T2 y T4 vs kóxido Graph')% Title
legend('Tcs','Tfs','T2','T4')

%% Q vs kóxido graph
vector_ejex=[2,2.5,3,3.5,4];
vector_ejeyQ=[2.016e+05,2.096e+05,2.153e+05,2.196e+05,2.229e+05];


figure(2)
plot(vector_ejex,vector_ejeyQ,'LineWidth',1)
ylabel('Q[W]') % Concepts and units
xlabel('kóxido[W/m^2*K]') % Concepts and units
title('Q vs kóxido Graph')% Title

%% Q vs kóxido reduction graph
vector_ejex=[2,2.5,3,3.5,4];
vector_ejeyQ=[18.51,15.28,12.98,11.24,9.90];

figure(3)
plot(vector_ejex,vector_ejeyQ,'LineWidth',1)
ylabel('Reduction [%]') % Concepts and units
xlabel('kóxido[W/m^2*K]') % Concepts and units
title('Q vs kóxido reduction Graph')% Title
