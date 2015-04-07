clear all; close all;

% Operador segunda derivada: Laplaciana
I = imread('Tema05a.jpg','jpeg');
II = double(I(1:4:end,1:4:end,1));

% Laplaciana por convolución
L = [-1 -1 -1; -1 8 -1; -1 -1 -1];

LL = conv2(II,L,'same');

[M,N,s] = size(II); 

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

figure; imshow(I); title('imagen original');
figure; imshow(B); title('Bordes Laplaciana');


