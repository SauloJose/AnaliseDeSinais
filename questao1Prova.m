%Avaliação - Análise de Sinais e Sistemas
% Alunos: Saulo José Almeida Silva / Lucas Daniel Dantas dos Passos
% Questão 1.
%data: 23/02/2023
%=====================================================================================================================================
%Serie de Exercícios sobre Matlab
%1.      A resposta ao impulso h(t) de um sistema pode ser obtida medindo a saída do sistema ao excitar
%o sistema com o sinal impulso, como representado na figura.
%
%Contudo, as características da função impulso ideal não são simples de reproduzir no mundo prático.
%De modo que é mais prático excitar o sistema com um degrau e obter a resposta do sistema ao degrau s(t), ver figura.
%
%Ao tentar obter-se a resposta ao impulso da onda sonora em um galpão de uma fábrica, encontrou-se
%muita dificuldade em gerar um som com o formato de impulso. Um estudante do Ifal sugeriu que se gravasse a resposta ao degrau que era “fácil”
%calcular a resposta ao impulso.
%
%Você concorda com esse estudante? Se não concordar, explique porque. Se concordar, elabore o
%código para obter a resposta ao impulso desejada a partir do áudio disponível no link.
%
%Dica: Ao convoluir o degrau com o impulso, obtêm-se o degrau como resultado.
%======================================================================%======================================================================
close all; clear all; clc;
%Copiando o audio que é a resposta ao degrau
[audio, fs] = audioread("audioQ1.wav");

#Tamanho do vetor do audio.
N_audio = length(audio)

%plotando gráfico
subplot(2,1,1);
plot(audio);
title("Resposta ao Degrau");
sound(audio,fs);

%A resposta ao impulso é a derivada da resposta ao degrau, então precisa tirar
% A derivada discreta é a primeira diferença h[n] = s[n] - s[n-1];
%causal.
impulso(1) = audio(1);

%realizando a derivada de tempo discreto
for i=1:1:size(audio)(1)-1;
    impulso(i+1) = audio(i+1) - audio(i);
end

%exibindo som da resposta ao impulso.
sound(impulso,fs);

%plotando a resposta ao impulso
subplot(2,1,2);
plot(impulso);
title("Resposta ao Impulso");



%======================================================================%======================================================================
%Ponto extra - Grave um áudio e realize a auralização com a resposta ao impulso obtida.
[audio_teste, fs] = audioread("audioTeste.wav");
sound(audio_teste,fs); %som original

%convoluindo o som que eu criei com a resposta ao impulso encontrada anteriormente.
audioNovo=conv(audio_teste, impulso);
sound(audioNovo,fs); %som auralizado
