function C = gauss_elimination(A,B)
    i = 1;
    X = [ A B ];
    [ nX mX ] = size( X);    
    while i <= nX
        if X(i,i) == 0
            disp('Diagonal element zero')
            return
        end
        X = elimination(X,i,i);
        i = i +1;
    end    
    C = X(:,mX);

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