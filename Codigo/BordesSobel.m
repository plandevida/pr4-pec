function [Os,Angulos] = BordesSobel(O,T)

% dimensiones de la imagen
[M,N] = size(O);

Os = zeros(M,N);
Angulos = zeros(M,N);

% mascaras Sobel
gx = [-1 0 1; -2 0 2; -1 0 1]; 
gy = [-1 -2 -1; 0 0 0; 1 2 1]; 

% Dimensión 2w+1
w = 1; %dimensión de la máscara 3x3
for i =1+w:1:M-w
    for j=1+w:1:N-w
      Ventana = double(O(i-w:1:i+w,j-w:1:j+w));  
      Ax = sum(sum(gx.*Ventana));
      Ay = sum(sum(gy.*Ventana));
      Angulos(i,j) = atan2(Ax,Ay);      
      A = abs(Ax) + abs(Ay);
      if A > T
         Os(i,j) = 255;         
      end
    end
end


