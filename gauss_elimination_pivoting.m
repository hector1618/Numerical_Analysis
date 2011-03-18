function C = gauss_elimination_pivoting(A,B)
% Gauss-elimination of coefficient matrix A
% for solving AX = B
    i = 1;
    X = [ A B ];% Agumented matrix
    [ nX mX ] = size( X);    
    while i <= nX
      if X(i,1:mX) == zeros(1,mX)
            continue
        end
      if X(i,i) == 0
                t = X(i, :);
                for k = i : (nX-1)
                        X(k,:) = X(k+1,:);
                end                
                X( nX, :) = t; 
        end
        X = elimination(X,i,i);
        C(:,1) = X(:,mX);
        i = i +1;
    end
    
    

function X = elimination(X,i,j)
% Pivoting (i,j) element of matrix X and eliminating other colume
% elements to zero
[ nX mX ] = size( X);
a = X(i,j);
X(i,:) = X(i,:)/a;
for k =  1:nX
    if k == i 
        continue
    end
    X(k,:) = X(k,:) - X(i,:)*X(k,j);
end