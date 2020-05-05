function [ap] = cal_mAP(train_label,test_label, IX)
% ap=apcal(score,label)
% average precision (AP) calculation 

[numtest, numtrain] = size(IX);

apall = zeros(1,numtest);
pp = test_label*train_label';
for i = 1 : numtest
    y = IX(i,:);
    x=0;
    p=0;
    
    num_return_NN = numtrain;%5000; % only compute MAP on returned top 5000 neighbours.
    for j=1:num_return_NN
        if pp(i,y(j))>0
            x=x+1;
            p=p+x/j;
        end
    end  
    if p==0
        apall(i)=0;
    else
        apall(i)=p/x;
    end
end

ap = mean(apall);
