% ===================================================================================
% Autor: Saulo José Almeida Silva
% Descrição: Utilizando o método do DFT (Discrete Fourier Transformation) para ana-
% lizar os dados de frequências nos dados da ONS, e buscar um padrão nesses
% dados
% Data: 14/02/2022
% ===================================================================================
clear all, close all; clc

%leitura do arquivo para elabora a transformada
x = xlsread('CurvaCargaHoraria.xlsx',1,'B3:DIP3')';
N = length(x);

% ===============================|| Algorítmo do DFT ||=============================

%Matriz de base da transformada.
matrizBase=((0:1:N-1)'*(0:1:N-1));
nucleo = exp(-(2*pi*1i)/N);
BaseFT = nucleo.^matrizBase;

% ===============================|PLOTANDO DADOS|===================================

%Transformada de FOURIER de tempo Curto
Y = BaseFT*x;
Y2 = fft(x);

%abela de frequências
fs = 1; %1 amostra por hora
freal = (0:N-1)*fs/N;

figure(1);
subplot(3,1,1), plot((0:1:N-1), x), title('Sinal original'),xlabel('Horas a partir de 15 de junho às 0:00 h'),ylabel(' (MWh/h)');
subplot(3,1,2), stem(freal,abs(Y)),title('Modulo'),xlabel('Frequência em amostras/Hora')
subplot(3,1,3), stem(freal,angle(Y)),title('Fase'),xlabel('Frequência em amostras/Hora')

figure(2);
subplot(3,1,1), plot((0:1:N-1), x), title('Sinal original'),xlabel('Horas a partir de 15 de junho às 0:00 h'),ylabel(' (MWh/h)');
subplot(3,1,2), stem(freal,abs(Y2)),title('Modulo'),xlabel('Frequência em amostras/Hora')
subplot(3,1,3), stem(freal,angle(Y2)),title('Fase'),xlabel('Frequência em amostras/Hora')