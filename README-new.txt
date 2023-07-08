%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% How to use: 
The starting point for running iPALM-DLMF is:

RUN_Cross_Validation.m
    This is for estimating the prediction performance of GRMF using cross 
    validation. More precisely, 5 repetitions of 10-fold cross validation 
    are performed, and then the AUPRs from the five repetitions are 
    averaged to give the final AUPR.

initializer.m   This is for setting initializer initializes the latent feature matrices. 
calculate_auc.m This is for calculating the AUC value. 
calculate_aupr.m This is for calculating the AUPR value.

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

This repository was established to hold the source code and data that were used for conducting the experiments explained in the following paper:
Graph regularized non-negative matrix factorization with L2,1 norm regularization terms for drug-target interactions prediction
Junjun Zhang, Minzhu Xie



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

*** Relevant Publication ***


Drug-target interaction prediction with graph-regularized matrix factorization
Ali Ezzat, Peilin Zhao, Min Wu, Xiao-Li Li and Chee-Keong Kwoh
https://github.com/alizat/GRMF

Ding, Y., Tang, J., Guo, F., Zou, Q.: Identification of drug–target
interactions via multiple kernel-based triple collaborative matrix
factorization. Briefings in Bioinformatics 23(2) (2022).
doi:10.1093/bib/bbab582
https://github.com/guofei-tju/IDTI-MK-TCMF


Gao, L.-G., Yang, M.-Y., Wang, J.-X.: Collaborative matrix
factorization with soft regularization for drug-target interaction
prediction. Journal of Computer Science and Technology 36(2),
310–322 (2021). doi:10.1007/s11390-021-0844-8


