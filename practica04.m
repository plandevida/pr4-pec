clear all; close all;

%% Perfiles de intensidad

I = imread('Tema05a.jpg','jpeg');
figure(1); imshow(I(:,:,1)); impixelinfo

improfile

%% Extracción de bordes primera y segunda derivada
clear all;

A = imread('Tema05a.jpg','jpeg');
I = A(1:4:end,1:4:end,1);

% operador de Sobel
T1 = 0.1; T2 = 0.2;

% devuelve las componentes horizontales y verticales
[Sobel_1, T, Sobel_H, Sobel_V] = edge(I,'sobel',T1);

Sobel_2 = edge(I,'sobel',T2);

figure(2);
subplot(2,3,1); imshow(I); title('Original');
subplot(2,3,2); imshow(Sobel_1); title('Sobel T = 0.1');
subplot(2,3,3); imshow(Sobel_2); title('Sobel T = 0.2');
subplot(2,3,4); imshow(10*Sobel_V); title('Componentes Horizontales');
subplot(2,3,5); imshow(10*Sobel_H); title('Componentes Verticales');

clear all;

% Operadores de Prewitt y Roberts
A = imread('Tema05a.jpg','jpeg');
I = A(1:4:end,1:4:end,1);

T1 = 0.1;
% operador de Prewitt
Prewitt = edge(I,'prewitt',T1);

% operador de Roberts
Roberts = edge(I,'roberts',T1);

figure(3);
subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(Prewitt); title('Prewitt T = 0.1');
subplot(2,2,3); imshow(Roberts); title('Roberts T = 0.1');

clear all;

% Algoritmo de Canny
A = imread('Tema05a.jpg','jpeg');
I = A(1:4:end,1:4:end,1);

% valor de los umbrales
T1 = 0.1; T2 = 0.2;

% valor de sigma en el suavizado gaussiano 
sigma = 5;

% operador de Canny
Canny1 = edge(I,'canny',T1, T2,sigma);

figure(4);
subplot(2,1,1); imshow(I); title('Original');
subplot(2,1,2); imshow(Canny1); title('Cannny T1 = 0.1; T2 = 0.2 y sigma = 5');

clear all;

% Zero-crossings
A = imread('Tema05a.jpg','jpeg');
I = double(A(1:4:end,1:4:end,1));

% valor del umbral
T = 0.2;
h = fspecial('average',3); 

ZR = edge(I,'zerocross');

figure(5);
subplot(2,1,1); imshow(A); title('Original');
subplot(2,1,2); imshow(ZR); title('Zero-crossing');

clear all;

w = 20; sigma = 4.5;
ww = 2*w + 1;
[x,y] = meshgrid(-w:0.4:w, -w:0.3:w);

x1 = -20:1:20;

n = (2-(x1.^2/sigma^2)) .* exp(-(x1.^2)/(2*sigma^2));
m = (2-((x.^2 + y.^2)/sigma^2)) .* exp( -(x.^2 + y.^2)/(2*sigma^2));

figure(6);
subplot(1,2,1); plot(x1,n,'Linewidth',2)

g = m / sum(sum(m));
subplot(1,2,2); surfc(x,y,g); colormap hsv

% Laplaciana de la Gaussiana
A = imread('Tema05a.jpg','jpeg');
I = double(A(1:4:end,1:4:end,1));

% valor del umbral
T1 = 3; sigma = 2;
LOG = edge(I,'log',T1, sigma);

figure(7);
subplot(1,2,1); imshow(A); title('Original');
subplot(1,2,2); imshow(LOG); title('LOG');
