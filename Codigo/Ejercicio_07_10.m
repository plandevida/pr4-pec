% EJERCICIOS RESUELTOS DE VISIÓN POR COMPUTADOR
% Autores: Gonzalo Pajares y Jesús Manuel de la Cruz
% Copyright RA-MA, 2007
% Ejercicio 7.10: Extracción de bordes, regiones y puntos de interés

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7.7.9 Puntos de interés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% puntos de interés

   clear all;
   f = [2 2 2 8 8; 2 2 2 8 8; 2 2 2 8 8; 8 8 8 8 8; 8 8 8 8 8];
   [m,n] = size(f);
   
   %valor del umbral
   U1 = 1.5;

    % Máscaras de derivación
    dx = [1 0 -1; 1 0 -1; 1 0 -1]; 
    dy = dx'; %dx resulta ser la matriz traspuesta de dy

    % Ix e Iy son las primeras derivadas derivadas horizontal y vertical 
    fX = conv2(f, dx, 'valid');    
    fY = conv2(f, dy, 'valid');
    
    fx = zeros(m,n); fy = fx;
    fx(2:1:m-1,2:1:n-1) = fX; 
    fy(2:1:m-1,2:1:n-1) = fY; 
    
    % Calculo de las segundas derivadas
    fxx = zeros(m,n); fyy = fxx; fxy = fxx;
    
    fXX = conv2(fx,dx,'valid');
    fYY = conv2(fy,dy,'valid');
    fXY = conv2(fx,dy,'valid');

    fxx(2:1:m-1,2:1:n-1) = fXX; 
    fyy(2:1:m-1,2:1:n-1) = fYY; 
    fxy(2:1:m-1,2:1:n-1) = fXY; 
    
    E = abs((fxx.*fy^2+fyy.*fx^2-2*fxy.*fx.*fy)./((fx^2+fy^2)^(3/2)+eps));

    PInteres = E >= U1;
    
    disp('fx: '); disp(fx);
    disp('fy: '); disp(fy);
    disp('fxx: '); disp(fxx);
    disp('fyy: '); disp(fyy);
    disp('fxy: '); disp(fxy);
    disp('E: '); disp(E);
    disp('Puntos de interés: '); disp(PInteres);

    