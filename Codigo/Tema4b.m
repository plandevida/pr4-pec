clear all; close all;

% Operador de sobel con diferentes umbrales

A = imread('Tema05a.jpg','jpeg');

I = A(1:4:end,1:4:end,1);

%operador de Sobel
T1 = 0.1; T2 = 0.20;

% devuelve las componentes horizontales y verticales
[Sobel_1, T, Sobel_H, Sobel_V] = edge(I,'sobel',T1);

Sobel_2 = edge(I,'sobel',T2);


figure; imshow(I); title('Original');
figure; imshow(Sobel_1); title('Sobel T = 0.1');
figure; imshow(Sobel_2); title('Sobel T = 0.2');
figure; imshow(10*Sobel_V); title('Componentes Horizontales');
figure; imshow(10*Sobel_H); title('Componentes Verticales');

