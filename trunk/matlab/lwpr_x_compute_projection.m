function s = lwpr_x_compute_projection(x,U,P)
% [s,dsdx] = lwpr_x_compute_projection(x,U,P)
%
% Recursively computes the PLS projections
%
% INPUT
%  x     Input vector
%  U     PLS regression axes
%  P     PLS projection axes
%
% OUTPUT
%  s     Projected input




% LWPR: A MATLAB library for incremental online learning
% Copyright (C) 2007  Stefan Klanke, Sethu Vijayakumar, Stefan Schaal
% Contact: sethu.vijayakumar@ed.ac.uk
%
% This library is free software; you can redistribute it and/or
% modify it under the terms of the GNU Lesser General Public
% License as published by the Free Software Foundation; either
% version 2.1 of the License, or (at your option) any later version.
%
% This library is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% Lesser General Public License for more details.
%
% You should have received a copy of the GNU Library General Public
% License along with this library; if not, write to the Free
% Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


[n_in, n_reg] = size(U);
s = zeros(n_reg,1);

for i=1:n_reg
  s(i)      = U(:,i)'*x;
  x         = x - P(:,i)*s(i);
end


