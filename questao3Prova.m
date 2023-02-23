%Avaliação - Análise de Sinais e Sistemas
% Alunos: Saulo José Almeida Silva / Lucas Daniel Dantas dos Passos
% Questão 3.
%data: 23/02/2023
%======================================================================
close all; clear all; clc;
##y[n] = a.y[n-1]+(1-a).x[n]
##Serie de Exercícios sobre Matlab
%carregando audio
[audio fs] = audioread("audio2.wav");

%======================================================================
## a)utilize a=0,80 e aplique o filtro ao áudio do link.
%Obs: Como o sinal é causal, antes dele acontecer considerarei como nulo.
% o primeiro valor será identico então ao audio
audio_filtrado(1) = audio(1);
a = 0.8;

%realizando a derivada de tempo discreto
for i=2:1:length(audio);
    audio_filtrado(i) = a*audio_filtrado(i-1) + (1-a)*audio(i);
end
%======================================================================
## b)Reproduza o áudio com e sem filtro.
%audio normal
sound(audio,fs);

%audio filtrado com a=0.8
sound(audio_filtrado,fs);

%======================================================================
## c) Apresente graficamente as amostras de 1000 a 1200 do áudio filtrado
## e do áudio não filtrado.

subplot(2,1,1);
plot(audio(1000:1200));
title("c) audio original não filtrado");

subplot(2,1,2);
plot(audio_filtrado(1000:1200));
title("c) audio original filtrado com a=0.8");

%======================================================================
## d) Utilize a=0,98 e aplique o filtro ao áudio do link.
audio_filtrado2(1) = audio(1);
b = 0.98;

%realizando a derivada de tempo discreto
for i=2:1:length(audio);
    audio_filtrado2(i) = b*audio_filtrado2(i-1) + (1-b)*audio(i);
end


%======================================================================
## e) reproduza o áudio com e sem filtro.
%audio normal
sound(audio,fs);

%audio filtrado com novo a=0.98
sound(audio_filtrado2,fs);


%======================================================================
## f) Apresente graficamente as amostras de 1000 a 1200 do áudio filtrado
## e do áudio não filtrado.
figure
subplot(2,1,1);
plot(audio(1000:1200));
title("f) audio original não filtrado");

subplot(2,1,2);
plot(audio_filtrado2(1000:1200));
title("f) audio original filtrado com a=0.98");

%======================================================================
## g)De acordo com o que foi reproduzido e com as representações gráficas, comente as influências do filtro.
##Possíveis vantagens e desvantagens.


