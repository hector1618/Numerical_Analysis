%for jacobi's methos
function x = jacobi ( A ,B )
disp ( ' Enter system of equations in the form of AX=B')

% Calling matrix A
A = input ( ' Enter matrix A :   \n')
% check for matrix A
% it should be a square matrix
[na , ma ] = size (A);
if na ~= ma
    disp('ERROR:matrix A should be a square matrix')
    return
end


% calling matrix B
B = input ( ' Enter matrix B :   ')
% check for matrix B
[nb , mb ] = size (B);
if nb ~= na || mb~=1
   disp( 'ERROR:input error..pls re-enter data')
   return
end

% A = D + L + U
D = diag(diag(A));
L = tril(A)- D;
U = triu(A)- D;

% check for convergence of system
e= max(eig(-inv(D)*(L + U)));

if abs(e) >= 1
    disp (' Since the modulus of largest eigen value of itarive matix is not less than 1') 
    disp ('This process is not concergent. Pls try some other process.')
    return
end

% initial guess for X..?
% default guess is [ 1 1 .... 1]'
r = input ( 'Any initial guess for X? (y/n):   ','s');
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
k= 1;

X( : , 1 ) = X0;
err= 1000000000*rand(na,1); %intial error assumtion for the sake of looping
while sum(abs(err) >= tol) ~= 0
    X ( : ,k+ 1 ) = -inv(D)*(L + U)*X( : ,k) + inv(D)*B;% JACOBI's formula
    err = X( :,k+1) - X( :, k);% finding error
    k = k + 1;
    
end

fprintf (' The final ans obtaibed after %g itaration which is  \n', k)
X( : ,k)


