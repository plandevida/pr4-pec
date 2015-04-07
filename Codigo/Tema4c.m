clear all; close all;

% Operadores de Prewitt y Roberts

A = imread('Tema05a.jpg','jpeg');
I = A(1:4:end,1:4:end,1);

T1 = 0.10;
% operador de Prewitt
Prewitt = edge(I,'prewitt',T1);

% operador de Roberts
Roberts = edge(I,'roberts',T1);

figure; imshow(I); title('Original');
figure; imshow(Prewitt); title('Prewitt T = 0.1');
figure; imshow(Roberts); title('Roberts T = 0.1');
