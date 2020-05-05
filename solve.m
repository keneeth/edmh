function [ params ] = solve( params )
%SOLVE 此处显示有关此函数的摘要
%   此处显示详细说明
A = params.A;
B = params.B;
Wx = params.Wx;
Wy = params.Wy;
X = params.X;
Y = params.Y;
ZA = params.ZA;
ZB = params.ZB;
LX = params.image_train_label;
LY = params.text_train_label;
LX = normr(LX);
LY = normr(LY);

lambda = params.lambda;
alpha = params.alpha;
beta = params.beta;
b = params.b;
epchos = params.epchos;

[n1,dim1] = size(X);
[n2,dim2] = size(Y);

%%
for i=1:epchos
    Wx = (X'*X+beta/lambda*eye(dim1))\(X'*A);
    Wy = (Y'*Y+beta/lambda*eye(dim2))\(Y'*B);
    
%     C = 1/b*S*B+2*alpha*A;
    C = 1/b*(2*LX*(LY'*B)-ones(n1,1)*(ones(n2,1)'*B)) + 2*alpha*A;
    ZA = calZ(C);
%     C = 1/b*S'*A+2*alpha*B;
   C = 1/b*(2*LY*(LX'*A)-ones(n2,1)*(ones(n1,1)'*A)) + 2*alpha*B;
    ZB = calZ(C);
    
%     A = sgn(1/b*S*ZB+2*lambda*X*Wx+2*alpha*ZA);
    A = sgn(1/b*(2*LX*(LY'*ZB)-ones(n1,1)*(ones(n2,1)'*ZB)) + 2*lambda*X*Wx+2*alpha*ZA);
%     B = sgn(1/b*S'*ZA+2*lambda*Y*Wy+2*alpha*ZB);
    B = sgn(1/b*(2*LY*(LX'*ZA)-ones(n2,1)*(ones(n1,1)'*ZA)) + 2*lambda*Y*Wy+2*alpha*ZB);
end
%%
params.A = A;
params.B = B;
params.Wx = Wx;
params.Wy = Wy;
params.ZA = ZA;
params.ZB = ZB;
end

