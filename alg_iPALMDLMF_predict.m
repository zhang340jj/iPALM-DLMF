function [A,B]=alg_iPALMDLMF_predict(Y,A,B,Ld,Lt,lambda_l,lambda_d,lambda_t,lambda_s,num_iter,W,options)

    K = size(A,2);
    lambda_d_Ld = lambda_d*Ld;
    lambda_t_Lt = lambda_t*Lt;

    
    K1=eye(size(A));
    K2=eye(size(B));
    lambda_l_eye_K1 = lambda_l*(K1);
    lambda_l_eye_K2 = lambda_l*(K2);
    [m,n] = size(Y); 
   
%L2,1
DA=1./sqrt(diag(A'*A));
DAT=bsxfun(@times,(A)',DA);
DB=1./sqrt(diag(B'*B));
DBT=bsxfun(@times,(B)',DB);


 options.display = 1; 
 options.maxiter = 200; 
 options.timemax = Inf; 
 options.inneriter = 1; 

 i = 1; 
 An=A;
 Bn = B; 
 Aold=A;
 Bold=B;


   for z=1:num_iter 
        

   alpha = (i-1)/0.5*(i+2); 
    
    %% Update A
    
    BBt = Bn'*Bn; 
    YBt = Y*Bn; 
%   Lw(i) = norm(BBt+ lambda_l_eye_K); 
    Lw(i) = norm(BBt); 
    Ay=An+alpha*(An - Aold);% extrapolation
   gradAy=Ay*BBt- YBt+ lambda_d_Ld*An+lambda_s*DAT';
    An=max(0,Ay-gradAy/Lw(i));
    A=An;
 
    
    %% Update B
    
  %  B=Bn;
    AtA = An'*An; 
    AntX=Y'*An;
%   Lh(i) = norm(AtA+ lambda_l_eye_K); 
    Lh(i) = norm(AtA); 
    By=Bn+alpha*(Bn - Bold);% extrapolation
 gradBy=By*AtA-AntX+lambda_t_Lt*Bn+lambda_s*DBT';
    Bn=max(0,By-gradBy/Lh(i));
    B=Bn;

end


