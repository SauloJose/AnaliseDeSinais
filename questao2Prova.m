%Avaliação - Análise de Sinais e Sistemas
% Alunos: Saulo José Almeida Silva / Lucas Daniel Dantas dos Passos
% Questão 2.
%data: 23/02/2023
%======================================================================
close all; clear all; clc;
%Amostras em 0-3s
amostragem = 0.025;

%intevalo de 0 a 3
tx1 = 0:amostragem:3
%intevalo de 3 a 7
tx2 = 3+amostragem:amostragem:7
%intevalo de 7 a 10
tx3 = 7+amostragem:amostragem:10

%gerando amostras
x=[zeros(size(tx1)) ones(size(tx2)) zeros(size(tx3))];


%===========================================================
%a) Encontre y = conv(x,x)
Nx = length(x)
Ny = 2*Nx-1

%deixando o sinal x e h com o mesmo tamanho do sinal de convolução
newX = [x zeros(1,Ny-Nx)];

%Efetuando a convolução
for n = 0 : Ny-1
  sum = 0;
  %convolução discreta Sum X[k] * H[N-K]
  for k=0: n
    sum = sum + newX(k+1)*newX(n-k+1);
  endfor

  %gerando um vetor que será utilizado como resultado da convolução disccreta
  y(n+1) = sum;
end

%domínios dos gráficos
nx = 0:amostragem:10;

%domínio da convolução
ny = min(nx)+min(nx):amostragem:max(nx)+max(nx);

%===========================================================
%b) Encontre z = conv(y,x)
%tomando tamanho dos vetores
Nx = length(x);
Ny = length(y);
Nz = Nx + Ny -1;

%deixando o sinal x e h com o mesmo tamanho do sinal de convolução
newX = [x zeros(1,Nz-Nx)];
newY = [y zeros(1,Nz-Ny)];

%Efetuando a convolução
for n = 0 : Nz-1
  sum = 0;
  %convolução discreta Sum X[k] * H[N-K]
  for k=0: n
    sum = sum + newX(k+1)*newY(n-k+1);
  endfor

  %gerando um vetor que será utilizado como resultado da convolução disccreta
  z(n+1) = sum;
end

%novo intervalo para nz
nz = min(nx)+min(ny) :amostragem: max(ny)+max(nx);


%===========================================================
%c) Represente gráficamente x,y e z com a escala de tempo considerando fa=15hz;
%plotando gráfico;
subplot(3,1,1);
plot(nx,x);
title("Sinal original");

subplot(3,1,2);
plot(ny,y);
title("convolução x * x");

subplot(3,1,3);
plot(nz,z);
title("convolução y * x === x * x * x");
