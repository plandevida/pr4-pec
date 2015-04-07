clear all; close all;

% Zero-crossings
A = imread('Tema05a.jpg','jpeg');
I = double(A(1:4:end,1:4:end,1));

% valor del umbral
T = 0.2;
h = fspecial('average',3); 

ZR = edge(I,'zerocross');

figure; imshow(A); title('Original');
figure; imshow(ZR); title('Zero-crossing');

