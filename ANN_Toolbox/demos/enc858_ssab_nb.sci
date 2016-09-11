// Loose 8-5-8 encoder
// on a backpropagation network without biases, with SuperSAB
// (Note that the tight 8-3-8 encoder will not work without biases)
// (The 8-4-8 encoder have proven very difficult to train on SuperSAB)

rand('seed',0);

// network def.
//  - neurons per layer, including input
N  = [8,5,8];

// inputs
x = [1,0,0,0,0,0,0,0;
     0,1,0,0,0,0,0,0;
     0,0,1,0,0,0,0,0;
     0,0,0,1,0,0,0,0;
     0,0,0,0,1,0,0,0;
     0,0,0,0,0,1,0,0;
     0,0,0,0,0,0,1,0;
     0,0,0,0,0,0,0,1]';

// targets, at training stage is acts as identity network
t = x;

// learning parameter
lp = [0.4, 0, 0.85, 1.004, 0.9999];

// init randomize weights between:
r = [-1,2];

W = ann_FF_init_nb(N,r);
mu = lp(1) * hypermat(size(W)',ones(prod(size(W)'),1));
Delta_W_old = hypermat(size(W)');
Delta_W_oldold = hypermat(size(W)');

// 350 epochs are enough to ilustrate
T = 350;
[W, Delta_W_old, Delta_W_oldold, mu] ...
  = ann_FF_SSAB_online_nb(x,t,N,W,lp,Delta_W_old,Delta_W_oldold,T,mu);

// full run
ann_FF_run_nb(x,N,W)

// encoder
encoder = ann_FF_run_nb(x,N,W,[2,2])
// decoder
decoder = ann_FF_run_nb(encoder,N,W,[3,3])

