%% Wang-Markov
% - feature = feature_wang(matrix, T)
% - Variable:
% ------------------------------------------input
% matrix                QMDCT matrix
% T                     threshold value
% -----------------------------------------output
% feature               feature vector

function feature = feature_wang(matrix, T)

matrix_abs = pre_process_matrix(matrix, 'dif1_v');

feature1 = get_markov(matrix, 'hv', T, 1);
feature2 = get_markov(matrix_abs, 'hv', T, 1);
feature3 = get_block_markov(matrix, 'hv', 2, T, 1);
feature4 = get_block_markov(matrix_abs, 'hv', 2, T, 1);

feature = [feature1;feature2;feature3;feature4];