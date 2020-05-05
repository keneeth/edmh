clear;clc;
%% 加载数据
db_name = 'wikiData';
exp_data = construct_data(db_name);

%% 超参数
alpha = 1e-1;
beta = 1e-1;
lambda = 1;
b = 32;
%%
params.X = exp_data.image_train;
params.Y = exp_data.text_train;
params.image_test = exp_data.image_test;
params.text_test = exp_data.text_test;
params.image_train_label = exp_data.image_train_label;
params.text_train_label = exp_data.text_train_label;
params.image_test_label = exp_data.image_test_label;
params.text_test_label = exp_data.text_test_label;

map = [];            
params.X = exp_data.image_train;
params.Y = exp_data.text_train;
params.image_test = exp_data.image_test;
params.text_test = exp_data.text_test;
params.epchos = 21;
params.image_train_label = exp_data.image_train_label;
params.text_train_label = exp_data.text_train_label;
params.image_test_label = exp_data.image_test_label;
params.text_test_label = exp_data.text_test_label;

params.b = b;
params.alpha = alpha;
params.beta = beta;
params.lambda = lambda;
params = initialize(params);
params = solve(params);
map = calMAP_ours(params);
fprintf('map: text_to_image %f, image_to_text %f\n',map(1),map(2));