%% Joint point-wise and multi-scale bolck-wise correlations (extraction) features
% - feature = feature_jpbc(matrix, T)
% - Variable:
% ------------------------------------------input
% matrix                QMDCT matrix
% T                     threshold value
% -----------------------------------------output
% feature               feature vector

function feature = feature_jpbc(matrix, T)

matrix_dif1_v = pre_process_matrix(matrix, 'dif1_v');
matrix_abs_dif1_h = pre_process_matrix(matrix, 'abs_dif1_h');
matrix_abs_dif2_v = pre_process_matrix(matrix, 'abs_dif2_v');
matrix_abs_dif2_h = pre_process_matrix(matrix, 'abs_dif2_h');

feature1 = get_point_block_markov(matrix, T);
feature2 = get_point_block_markov(matrix_dif1_v, T);
feature3 = get_point_block_markov(matrix_abs_dif1_h, T);
feature4 = get_point_block_markov(matrix_abs_dif2_v, T);
feature5 = get_point_block_markov(matrix_abs_dif2_h, T);

feature = [feature1;feature2;feature3;feature4;feature5];