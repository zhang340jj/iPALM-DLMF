---------------------------------------------------------------------------

*** How to run iPALM-DLMF? ***

The starting point for running iPALM-DLMF is:



In the above file, there are many options that may be set, including:

> classifier
> use_WKNKN
> cv_setting
> cross validation parameters: m, n

---------------------------------------------------------------------------

*** Algorithm entry points ***

The main entry scripts for the different algorithms are:


> alg_iPALMDLMF.m


Some parameters may be manually set to a fixed value, while others are 
estimated via nested CV. These parameters may be found in the above files, 
or if their values are determined by nested CV, they may be found in 
scripts that have the suffix "parest_":

> alg_iPALMDLMF_parest.m


---------------------------------------------------------------------------


*** Relevant Publication ***

Graph regularized non-negative matrix factorization with L2,1 norm regularization terms
for drug-target interactions prediction
Junjun Zhang and Minzhu Xie*

---------------------------------------------------------------------------