%Harris		
%
%	H = harris(I)
%
%	Devuelve una imagen H de puntos de interés, a partir de la imagen de
%	gris original y una imagen binaria B con los puntos de interés localizados en las posiciones (x,y)
%
function [H,B] = harris(im,K)

    [M,N] = size(im); 
    %K = 0.4; 
    epsilon = 0.5;
    B = zeros(M,N);       
    H = im;
    mask = [-1 0 1; -1 0 1; -1 0 1] / 3;

	% computar lso gradientes horizontal y vertical
	Ix = conv2(im, mask, 'same');
	Iy = conv2(im, mask', 'same');
	
	% compute cuadrados y productos
	Ixy = Ix .* Iy;
	Ix = Ix.^2;
	Iy = Iy.^2;

	% suavizado
	gmask = igauss(1, 1);

	Ix = conv2(Ix, gmask, 'same');
	Iy = conv2(Iy, gmask, 'same');
	Ixy = conv2(Ixy, gmask, 'same');

    R = zeros(M,N); Harris = R;
    for i=1+2:1:M-2
        for j=1+2:1:N-2
           a11 = 0; a12 = 0; a21 = 0; a22 = 0; 
           for h=-2:1:2
               for k=-2:1:2
                 a11 = a11 + Ix(i+h,j+k)^2; a22 = a22 + Iy(i+h,j+k)^2;
                 a12 = a12 + Ixy(i+h,j+k);  a21 = a12;    
               end
           end     
           Mat = [a11 a12; a21 a22];
           % para el calculo de los operadores de Harris 
           Harris(i,j) = det(Mat)-K*trace(Mat);      
       end   
    end

    % busqueda de maximos locales
    for i=1+2:1:M-2
      for j=1+2:1:N-2
          kk = 1;
          for h=-2:1:2
            for k=-2:1:2
               vh(kk) = Harris(i+h,j+k);
               kk = kk + 1;   
            end
          end     
          hmax = max(vh);   
          
          if (vh (13) == hmax) & (std(vh) ~= 0) 
             % el valor central es un maximo local y además 
             % no es una región homogenéa por eso lo marcamos   
             B(i,j) = 255;
             for h=-1:1:1
              for k=-1:1:1
                 H(i+h,j+k) = 255;      
              end
            end    
          end
          
       end                              
    end
   
          
