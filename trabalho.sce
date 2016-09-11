N = [...
1 0 0 0 1 ...
1 1 0 0 1 ...
1 0 1 0 1 ...
1 0 0 1 1 ...
1 0 0 0 1 ...
]';

T = [...
1 1 1 1 1 ...
0 0 1 0 0 ...
0 0 1 0 0 ...
0 0 1 0 0 ...
0 0 1 0 0 ...
]';

C = [...
1 1 1 1 1 ...
1 0 0 0 0 ...
1 0 0 0 0 ...
1 0 0 0 0 ...
1 1 1 1 1 ...
]';

Caractere_7 = [...
1 1 1 1 1 ...
0 0 0 1 0 ...
0 0 1 0 0 ...
0 1 0 0 0 ...
1 0 0 0 0 ...
]';

Caractere_2 = [...
1 1 1 1 1 ...
0 0 0 0 1 ...
1 1 1 1 1 ...
1 0 0 0 0 ...
1 1 1 1 1 ...
]';

Caractere_5 = [...
1 1 1 1 1 ...
1 0 0 0 0 ...
1 1 1 1 1 ...
0 0 0 0 1 ...
1 1 1 1 1 ...
]';

Caractere_4 = [...
1 0 0 0 1 ...
1 0 0 0 1 ...
1 1 1 1 1 ...
1 0 0 0 1 ...
0 0 0 0 1 ...
]';

n = [25 20 7];

W = ann_FF_init(n);

x = [N, T, C, Caractere_7, Caractere_2, Caractere_5, Caractere_4];

teste_N = [1 0 0 0 0 0 0]';

teste_T = [0 1 0 0 0 0 0]';

teste_C = [0 0 1 0 0 0 0]';

teste_7 = [0 0 0 1 0 0 0]';

teste_2 = [0 0 0 0 1 0 0]';

teste_5 = [0 0 0 0 0 1 0]';

teste_4 = [0 0 0 0 0 0 1]';

teste = [teste_N, teste_T, teste_C, teste_7, teste_2, teste_5, teste_4];

// Other training parameters are the learning rate and the threshold of error
lp = [0.5, 0];

// The number of training cycles:
epochs = 500;

// The network is trained with the standard backpropagation in batch mode
W = ann_FF_Std_batch(x,teste,n,W,lp,epochs);

y = ann_FF_run(x,n,W);

disp(y);

N_ruido = [...
1 0 0 0 1 ...
1 0 0 0 1 ...
1 0 1 0 1 ...
1 0 1 1 1 ...
1 0 0 0 1 ...
]';

y = ann_FF_run(N_ruido,n,W);

disp(y);

