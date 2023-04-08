function [A,B]=initializer(Y,K)
%initializer initializes the A and B latent feature matrices for the
%CMF/GRMF/WGRMF algorithms.
%
% [A,B] = initializer(Y,K)
%
% INPUT:
%  Y:   interaction matrix to be decomposed into latent feature matrices
%  K:   number of latent features
%
% OUTPUT:
%  A:   latent feature matrix for drugs
%  B:   latent feature matrix for targets

%     [u,s,v] = svds(Y,K);
%     A = u*(s^0.5);
%     B = v*(s^0.5);

%   % 1st SVD --> partial SVD rank-k to the input matrix A. 
[u,s,V] = svds(Y,K);


%choose the first singular triplet to be nonnegative
A(:,1)     =  sqrt(s(1,1)) * abs(u(:,1) );         
B(:,1)     =  sqrt(s(1,1)) * abs(V(:,1)); 


% 2nd SVD for the other factors (see table 1 in our paper)
for i=2:26
%     for i=2:49
%    for i=2:50
%     for i=2:50
    uu = u(:,i); vv = V(:,i);
    uup = pos(uu); uun = neg(uu) ;
    vvp = pos(vv); vvn = neg(vv);
    n_uup = norm(uup);
    n_vvp = norm(vvp) ;
    n_uun = norm(uun) ;
    n_vvn = norm(vvn) ;
    termp = n_uup*n_vvp; termn = n_uun*n_vvn;
    if (termp >= termn)
        A(:,i) = sqrt(s(i,i)*termp)*uup/n_uup; 
        B(:,i) = sqrt(s(i,i)*termp)*vvp'/n_vvp;
    else
        A(:,i) = sqrt(s(i,i)*termn)*uun/n_uun; 
        B(:,i) = sqrt(s(i,i)*termn)*vvn'/n_vvn;
    end
end

% NNDSVDa: fill in the zero elements with the average 
if flag==1
   ind1      =  find(A==0) ;%返回向量中零元素的位置
   ind2      =  find(B==0) ;
   average   =  mean(Y(:)) ; 
   A( ind1 ) =  average    ; 
   B( ind2 ) =  average    ;

% NNDSVDar: fill in the zero elements with random values in the space [0:average/100]
elseif flag==2
   ind1      =  find(W==0) ;
   ind2      =  find(H==0) ;
   n1        =  numel(ind1);
   n2        =  numel(ind2);
   
   average   =  mean(A(:))       ;
   A( ind1 ) =  (average*rand(n1,1)./100)  ; 
   B( ind2 ) =  (average*rand(n2,1)./100)  ;   
end

end
%--------------------------------------------------------------------------
%end of the nndsvd function



%This function sets to zero the negative elements of a matrix
%--------------------------------------------------------------------------
function [Yp] = pos(Y)
Yp = (Y>=0).*Y;
end
%--------------------------------------------------------------------------

%This functions sets to zero the positive elements of a matrix and takes
%the absolute value of the negative elements
%--------------------------------------------------------------------------
function [Ym] = neg(Y);
Ym = (Y<0).*(-Y);
end    
%     
  
%%NNDSVD-LRC
% if issparse(Y)
 %    [u,s,v] = svds(Y,K); 
% else
%     [u,s,v] = mySVD(Y,K); 
% end


%     [u,s,v] = svds(X,p); 
% 
% A = u*sqrt(s); 
% B = sqrt(s)*v'; 
% % Best rank-one approximation
% A1(:,1) = abs(A(:,1)); 
% B1(1,:) = abs(B(1,:)); 
% % Next (r-1) rank-one factors
% i = 2; j = 2; 
% while i <= K
%     if mod(i,2) == 0
%         A1(:,i) = max(A(:,j),0); 
%         B1(i,:) = max(B(j,:),0); 
%     else
%         A1(:,i) = max(-A(:,j),0); 
%         B1(i,:) = max(-B(j,:),0);
%         j = j+1;
%     end
%     i = i+1; 
% end
    
    
    
    
    
