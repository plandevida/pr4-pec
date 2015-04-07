clear all; close all;

% Algoritmo de Canny
A = imread('Tema05a.jpg','jpeg');
I = A(1:4:end,1:4:end,1);


%%%%%%%%%%%%%%%% implemantación del Image Toolbox de Matlab %%%%%%%%%%%%%%%%%
% valor de los umbrales
T1 = 0.10; T2 = 0.5;

% valor de sigma en el suavizado gaussiano 
sigma = 5;

% operador de Canny
Canny1 = edge(I,'canny',T1, T2,sigma);

figure; imshow(I); title('Original');
figure; imshow(Canny1); title('Image Toolbox MATLAB cannny T1 = 0.10; T2 = 0.5 y sigma = 5');
%%%%%%%%%%%%%%%%%%%%%%%%% implemantación de Matlab %%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%% segunda implemantación %%%%%%%%%%%%%%%%%
Canny2 = cannyedge(I);
figure; imshow(Canny2); title('cannny T1 = 0.10; T2 = 0.5 y sigma = 5');


