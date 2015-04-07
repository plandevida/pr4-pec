%IGAUSS	Gaussian smoothing kernel
%
%	M = IGAUSS(W, SIGMA)
%
%	Returns a W x W matrix with a unit amplitude Gaussian function of
%	standard deviation SIGMA.  The Gaussian is centered within the matrix.
%
% SEE ALSO:	ilog conv2
%
%	Copyright (c) Peter Corke, 1999  Machine Vision Toolbox for Matlab


%	pic 10/96

function m = igauss(w, sigma)

	ww = 2*w + 1;

	[x,y] = meshgrid(-w:w, -w:w);

	m = 1/(2*pi) * exp( -(x.^2 + y.^2)/2/sigma^2);

	m = m / sum(sum(m));

