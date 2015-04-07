clear all; close all;


w = 20; sigma = 4.5;
ww = 2*w + 1;
[x,y] = meshgrid(-w:0.4:w, -w:0.3:w);

x1 = -20:1:20;

n = (2-(x1.^2/sigma^2)) .* exp(-(x1.^2)/(2*sigma^2));
m = (2-((x.^2 + y.^2)/sigma^2)) .* exp( -(x.^2 + y.^2)/(2*sigma^2));

figure; plot(x1,n,'Linewidth',2)

g = m / sum(sum(m));
figure; surfc(x,y,g); colormap hsv


% Laplaciana de la Gaussiana
A = imread('Tema05a.jpg','jpeg');
I = double(A(1:4:end,1:4:end,1));

% valor del umbral
T1 = 3; sigma = 2;
LOG = edge(I,'log',T1, sigma);

figure; imshow(A); title('Original');
figure; imshow(LOG); title('LOG');


