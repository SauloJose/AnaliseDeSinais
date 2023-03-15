% ===================================================================================
% Autor: Saulo José Almeida Silva
% Descrição: Utilizando o método do STFT (Short Time Fourier Transformation) para ana-
% lizar os dados de frequências nos dados da ONS, e buscar um padrão nesses
% dados
% Data: 14/02/2022
% ===================================================================================
clear all, close all; clc

%leitura do arquivo para elabora a transformada
x = xlsread('CurvaCargaHoraria.xlsx',1,'B3:DIP3');
L = length(x);

% ===============================|| Algorítmo do STFT ||=============================
%Variáveis necessárias
%quantidade de amostras de uma janela
N = 128;

%Passo para cada janela H, ou seja, quantas "amostras" ele pula para gerar
%uma nova janela
H = N/2;

%Número de janelas (subintervalos) divididos
M = floor((L-N)/H);

%função de janela
t = linspace(-2,2,N); %variável intermediária
w = exp((-t.^2)/1.5);

%Matriz de base da transformada.
matrizBase=((0:1:N-1)'*(0:1:N-1));
nucleo = exp(-(2*pi*1i)/N);
BaseFT = nucleo.^matrizBase;

%Heinkelização do sinal
hx=zeros(N,M+1);
for a=0:1:M
        hx(:,a+1) = x(1+a*H:N+a*H)';
end

%Transformada de FOURIER de tempo Curto
hx=w'.*hx; %Aplicando a função de janela gaussiana
Y = BaseFT*hx;

%Normalizando valores, considerando cada janela
Y = Y / N ;
% ===============================|buscando frequências|===================================
%Tabelando frequências
fs = 1; %1 amostra por hora
freal = (0:N-1)*fs/N;


%Valor médio será o máximo dos valores médios das janelas
Vmed=max(max(abs(Y(1,:))));

%A frequência me maior amplitude será o máximo dos maiores valores de frequência 
% das janelas
freq=zeros(1,M+1);
for m=1:1:M
    [V, k] = max(abs(Y(2:floor(N/2)+1,m)));
    k
    freq(m)=k;
end

k1=max(freq(m));%Pegando o maior valor.
freqMax = k1*fs/N;


%Período do maior sinal
T=ceil(1/freqMax)


%Consequêntemente, o período da frequência maior do sinal será T horas
%Pode-se observar que para esse caso aqui, a STFT não é tão eficiente, como
%a DFT foi na análise desses dados.
% ===============================|PLOTANDO DADOS|===================================
S = 10; %Número da janela
Amostras = 0:L-1;

figure(1);
subplot(3,1,1), plot(Amostras, x), title('Sinal original'),xlabel('Horas a partir de 15 de junho Às 0:00 h'),ylabel(' (MWh/h)');
str = "módulo do STFT na janela "+S;
str2= "Fase do STFT na janela"+S;
subplot(3,1,2), stem(freal, abs(Y(:,S))), title(str),xlabel('Frequência em amostras/Hora');
subplot(3,1,3), stem(freal, angle(Y(:,S))), title(str2),xlabel('Frequência em amostras/Hora');
