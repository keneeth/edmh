function [ params ] = initialize(params)
%%
b = params.b;
[n1,dim1] = size(params.X);
[n2,dim2] = size(params.Y);

randn('seed',1);
params.ZA = randn(n1,b);
params.A = sgn(params.ZA);
randn('seed',1);
params.ZB = randn(n2,b);
params.B = sgn(params.ZB);
params.Wx = rand(dim1,b);
params.Wy = rand(dim2,b);

end

