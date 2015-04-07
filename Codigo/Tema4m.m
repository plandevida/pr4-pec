
clear all; close all

I = imread('Tema05a.jpg','jpeg');
A = I(1:4:end,1:4:end,1);

AA = double(A);

K = 200;
[H,B] = harris(AA,K);

figure; imshow(I); title('Imagen original','FontSize',12);
figure; imshow(mat2gray(H)); title('Puntos de interés','FontSize',16);
figure; imshow(B); title('Localizaciones','FontSize',16);