clear all; close all

% Practica 3

%% 1) Perfiles

A = imread('Tema05a.jpg','jpeg');
figure(1); imshow(A(:,:,1)); impixelinfo

improfile 

%% 2) Sobel

I = A(1:4:end,1:4:end,1);
clear A

% umbrales para Sobel
T1 = 0.10; T2 = 0.20;

% devuelve las componentes horizontales y verticales
[Sobel_1, T, Sobel_H, Sobel_V] = edge(I,'sobel',T1);

Sobel_2 = edge(I,'sobel',T2);

figure; imshow(I); title('Original');
figure; imshow(Sobel_1); title('Sobel T = 0.1','FontSize',16);
figure; imshow(Sobel_2); title('Sobel T = 0.2','FontSize',16);
figure; imshow(10*Sobel_V); title('Componentes Horizontales','FontSize',16);
figure; imshow(10*Sobel_H); title('Componentes Verticales','FontSize',16);


%% 3) Prewitt

T1 = 0.10;
Prewitt = edge(I,'prewitt',T1);

%% 4) Roberts
Roberts = edge(I,'roberts',T1);

figure; imshow(Prewitt); title('Prewitt T = 0.1','FontSize',16);
figure; imshow(Roberts); title('Roberts T = 0.1','FontSize',16);

%% 5) Canny

% valor de los umbrales
T1 = 0.10; T2 = 0.50;

% valor de sigma en el suavizado gaussiano 
sigma = 5;

% operador de Canny
Canny1 = edge(I,'canny',T1, T2,sigma);

figure; imshow(I); title('Original','FontSize',16);
figure; imshow(Canny1); title('Image Toolbox MATLAB cannny T1 = 0.10; T2 = 0.5 y sigma = 5','FontSize',16);

%% 6) Zero-Crossing

ZR = edge(I,'zerocross');
figure; imshow(ZR); title('Zero-crossing','FontSize',16);

%% Laplaciana de la Gaussiana

w = 20; sigma = 4.5;
ww = 2*w + 1;
[x,y] = meshgrid(-w:0.4:w, -w:0.3:w);

x1 = -20:1:20;

n = (2-(x1.^2/sigma^2)) .* exp(-(x1.^2)/(2*sigma^2));
m = (2-((x.^2 + y.^2)/sigma^2)) .* exp( -(x.^2 + y.^2)/(2*sigma^2));

figure; plot(x1,n,'Linewidth',2)

g = m / sum(sum(m));
figure; surfc(x,y,g); colormap hsv


% Laplaciana de la Gaussiana de Matlab

% valor del umbral
T1 = 3; sigma = 2;
I = double(I);
LOG = edge(I,'log',T1, sigma);

figure; imshow(LOG); title('LOG','FontSize',16);

%% Opcional 1: Método de Sobel propio

T = 100; %umbral
[Bordes, Angulos] = BordesSobel(I,T);

figure; imshow(mat2gray(Bordes)); title('Bordes Sobel propio','FontSize',16);
figure; imshow(mat2gray(Angulos)); title('Angulos Sobel','FontSize',16);

%% Opcional 2: Laplaciana con convolución

% Operador segunda derivada: Laplaciana

% Laplaciana por convolución
L = [-1 -1 -1; -1 8 -1; -1 -1 -1];

LL = conv2(I,L,'same');

[M,N] = size(I); 

B = zeros(M,N);

t = 150;
for i=2:1:M-1
    for j=2:1:N-1
      if ((LL(i,j) < -t) && ((LL(i-1,j-1) > t)||(LL(i-1,j) > t)||(LL(i-1,j+1) > t)||...
                           (LL(i,j-1) > t)||                 (LL(i,j+1) > t)||...
                           (LL(i+1,j-1) > t)||(LL(i+1,j) > t)||(LL(i+1,j+1) > t)))
          B(i,j) = 255;
      end
        
      if ((LL(i,j) > t)  && ((LL(i-1,j-1) < -t)||(LL(i-1,j) < -t)||(LL(i-1,j+1) < -t)||...
                           (LL(i,j-1) < -t)||                 (LL(i,j+1) < -t)||...
                           (LL(i+1,j-1) < -t)||(LL(i+1,j) < -t)||(LL(i+1,j+1) < -t)))
          B(i,j) = 255;
      end
        
    end
end

figure; imshow(B); title('Bordes Laplaciana','FontSize',16);

%% Opcional 3: Operador de Harris

K = 200;
[H,B] = harris(I,K);

figure; imshow(mat2gray(H)); title('Puntos de interés','FontSize',16);
figure; imshow(B); title('Localizaciones','FontSize',16);

