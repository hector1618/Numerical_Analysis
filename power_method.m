function [ v d] = power_method( A )
% for finding the largest eigen value by pawer methode

disp ( ' Enter the matrix whole eigen value is too be found')

% Calling matrix A
A = input ( ' Enter matrix A :   \n')
% check for matrix A
% it should be a square matrix
[na , ma ] = size (A);
if na ~= ma
    disp('ERROR:matrix A should be a square matrix')
    return
end

% initial guess for X..?
% default guess is [ 1 1 .... 1]'
disp('Suppose X is an eigen vector corresponding to largest eigen value of matrix A')
r = input ( 'Any guess for initial value of X? (y/n):   ','s');
switch r 
    case 'y'
        % asking for initial guess
    X0 = input('pls enter initial guess for X :\n')
        % check for intial guess
    [nx, mx] = size(X0);
    if nx ~= na || mx ~= 1
        disp( 'ERROR: pls check input')
        return
    end
    otherwise
    X0 = ones(na,1);
end

%allowed error in final answer
t = input ( 'enter the error allowed in final ans:  ');
tol = t*ones(na,1);
% initialing k and X
k= 1;
X( : , 1 ) = X0;
 %intial error assumtion for of looping
err= 1000000000*rand(na,1);
% loop starts
while sum(abs(err) >= tol) ~= 0
    X( : ,k+ 1 ) = A*X( : ,k); %POWER METHOD formula
    % normalising the optained vector 
    [ v i ] = max(abs(A*X( : ,k+ 1 )));
    E = X( : ,k+ 1 );
    e = E( i,1);
    X(:,k+1) = X(:,k+1)/e;
    err = X( :,k+1) - X( :, k);% finding error
    k = k + 1;  
end

%display of final result
fprintf (' The largest eigen value obtained after %d itarations is  %7.7f  \n', k, e)
disp('and the corresponding eigen vector is ')
X( : ,k)