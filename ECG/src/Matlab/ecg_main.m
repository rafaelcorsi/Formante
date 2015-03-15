%% Rafael Corsi 
% Núcleo de Sistemas Eletrônicos Embarcados - NSE^2
% Script de geração de ECG para tratamento de sinais em HIL

% Taxa de amostragem
Ts = 1/1E-3;

%% Carrega dados previamente simulados
load ecg_dado_v2;

% Cria vetor de dados utilizado pelo simulink
dado.time = [];

% Interpola o dado 
dado.signals.values = interp(ecg', (1/Ts)/(size(x,2)/max(x))) ; 

%% Plota sinal
figure
plot(dado.signals.values)
title('ECG com taxa de amostragem de Ts = 1E-3')

%% Plota FFT
figure
L = 2000;
Fs = 1/Ts; 

f = Fs/2*linspace(0,1,L/2 + 1);
Y = fft(simout(1:L));

stem(f,abs(Y(1:L/2 + 1)));
title('ECG Spectrum')
xlabel('Frequency (Hz)')
ylabel('|ECG|')
