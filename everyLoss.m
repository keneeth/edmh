function [ losses ] = everyLoss( params )
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

lambda = params.lambda;
alpha = params.alpha;
beta = params.beta;
b = params.b;
[n,dim1] = size(X);

losses = zeros(3,1);
losses(1) = 1/2*(trace(4*(LY'*LY)*(LX'*LX)) - trace(2*LY'*ones(n,1)*ones(n,1)'*LX) - trace(2*ones(n,1)'*LY*LX'*ones(n,1)) + ...
    ones(n,1)'*ones(n,1)*ones(n,1)'*ones(n,1) - trace(2/b*LY'*B*ZA'*LX) + trace(1/b*ones(n,1)'*B*ZA'*ones(n,1)) - ...
    trace(2/b*B'*LY*LX'*ZA) + trace(1/b*B'*ones(n,1)*ones(n,1)'*ZA) + trace(1/b/b*(B'*B)*(ZA'*ZA)));
losses(1) = losses(1) + 1/2*(trace(4*(LY'*LY)*(LX'*LX)) - trace(2*LY'*ones(n,1)*ones(n,1)'*LX) - trace(2*ones(n,1)'*LY*LX'*ones(n,1)) + ...
    ones(n,1)'*ones(n,1)*ones(n,1)'*ones(n,1) - trace(2/b*LY'*ZB*A'*LX) + trace(1/b*ones(n,1)'*ZB*A'*ones(n,1)) - ...
    trace(2/b*ZB'*LY*LX'*A) + trace(1/b*ZB'*ones(n,1)*ones(n,1)'*A) + trace(1/b/b*(ZB'*ZB)*(A'*A)));
losses(2) = sum(sum((X*Wx-A).^2)) + sum(sum((Y*Wy-B).^2));
losses(3) = sum(sum((ZA-A).^2)) + sum(sum((ZB-B).^2));

end

