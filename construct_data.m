function [ exp_data ] = construct_data( dbname )
%CONTRUCT_DATA 此处显示有关此函数的摘要
%   此处显示详细说明
switch(dbname)
    case 'mirflickr25k'
        load 'datasets/mirflickr25k.mat';
        exp_data.image_train = I_tr;
        exp_data.image_test = I_te;
        exp_data.text_train = T_tr;
        exp_data.text_test = T_te;
        exp_data.image_train_label = L_tr;
        exp_data.image_test_label = L_te;
        exp_data.text_train_label = L_tr;
        exp_data.text_test_label = L_te;
    case 'wikiData'
        load 'datasets/wikiData.mat';
        exp_data.image_train = I_tr;
        exp_data.image_test = I_te;
        exp_data.text_train = T_tr;
        exp_data.text_test = T_te;
        train_label = zeros(2173,10);
        for i=1:2173
            train_label(i,L_tr(i)) = 1;
        end
        test_label = zeros(693,10);
        for i=1:693
            test_label(i,L_te(i)) = 1;
        end
        exp_data.image_train_label = train_label;
        exp_data.image_test_label = test_label;
        exp_data.text_train_label = train_label;
        exp_data.text_test_label = test_label;
    case 'nus_wide'
        load 'datasets/nus_wide_data_hashing.mat';
        image_feat = biaozhunhua(image_feat);
        text_feat = biaozhunhua(text_feat);
        n = size(image_feat,1);
        ntest = floor(n*0.01);
        rand('seed',2);
        p = randperm(n);
        exp_data.image_test = image_feat(p(1:ntest),:);
        exp_data.text_test = text_feat(p(1:ntest),:);
        exp_data.image_test_label = labels(p(1:ntest),:);
        exp_data.text_test_label = labels(p(1:ntest),:);
        p(1:ntest) = [];
        exp_data.image_train = image_feat(p,:);
        exp_data.text_train = text_feat(p,:);
        exp_data.image_train_label = labels(p,:);
        exp_data.text_train_label = labels(p,:);
end
fprintf('construct data finished.\n');

end

