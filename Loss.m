function [ los ] = Loss( params )
%LOSS 此处显示有关此函数的摘要
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
LX = normalize(LX);
LY = normalize(LY);
n = size(LX,1);

lambda = params.lambda;
alpha = params.alpha;
beta = params.beta;
b = params.b;

los = 0;
los = los + 1/2*(trace(4*(LY'*LY)*(LX'*LX)) - trace(2*LY'*ones(n,1)*ones(n,1)'*LX) - trace(2*ones(n,1)'*LY*LX'*ones(n,1)) + ...
    ones(n,1)'*ones(n,1)*ones(n,1)'*ones(n,1) - trace(2/b*LY'*B*ZA'*LX) + trace(1/b*ones(n,1)'*B*ZA'*ones(n,1)) - ...
    trace(2/b*B'*LY*LX'*ZA) + trace(1/b*B'*ones(n,1)*ones(n,1)'*ZA) + trace(1/b/b*(B'*B)*(ZA'*ZA)));
los = los + 1/2*(trace(4*(LY'*LY)*(LX'*LX)) - trace(2*LY'*ones(n,1)*ones(n,1)'*LX) - trace(2*ones(n,1)'*LY*LX'*ones(n,1)) + ...
    ones(n,1)'*ones(n,1)*ones(n,1)'*ones(n,1) - trace(2/b*LY'*ZB*A'*LX) + trace(1/b*ones(n,1)'*ZB*A'*ones(n,1)) - ...
    trace(2/b*ZB'*LY*LX'*A) + trace(1/b*ZB'*ones(n,1)*ones(n,1)'*A) + trace(1/b/b*(ZB'*ZB)*(A'*A)));
los = los + lambda * sum(sum((X*Wx-A).^2));
los = los + lambda * sum(sum((Y*Wy-B).^2));
los = los + beta * sum(sum(Wx.^2));
los = los + beta * sum(sum(Wy.^2));
los = los + alpha * sum(sum((ZA-A).^2));
los = los + alpha * sum(sum((ZB-B).^2));
end

