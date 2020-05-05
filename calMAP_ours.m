function [ MAP_test] = calMAP_ours( params )
% 
A = params.A;
A(A<0) = 0;
A = compactbit(A);
B = params.B;
B(B<0) = 0;
B = compactbit(B);

image_test = params.image_test;
image_test_B = image_test*params.Wx;
image_test_B = sgn(image_test_B);
image_test_B(image_test_B<0) = 0;
image_test_B = compactbit(image_test_B);

text_test = params.text_test;
text_test_B = text_test*params.Wy;
text_test_B = sgn(text_test_B);
text_test_B(text_test_B<0) = 0;
text_test_B = compactbit(text_test_B);

Dhamm = hammingDist(text_test_B, A);
[~, HammingRank]=sort(Dhamm,2);
MAP_test(1) = cal_mAP(params.image_train_label,params.text_test_label,HammingRank);

Dhamm = hammingDist(image_test_B, B);
[~, HammingRank]=sort(Dhamm,2);
MAP_test(2) = cal_mAP(params.text_train_label,params.image_test_label,HammingRank);

Dhamm = hammingDist(image_test_B, A);
[~, HammingRank]=sort(Dhamm,2);
MAP_test(3) = cal_mAP(params.image_train_label,params.image_test_label,HammingRank);

end

