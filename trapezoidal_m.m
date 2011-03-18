function I = trapezoidal_m( X )
% for calculating intergrals using trapezoidal rule when values are known

% options for the data
m = menu( 'Pls specify the format of input',' Values to be entered',...
    'Values are to be imported from xls sheet', 'Values are in different format');
switch m 
    case 1       
       X = input('Enter the values in the form of nx2 matrix \n') ;
    case 2
        disp(' xlc should not contain anyother value than numbers and that also in first 2 coloums');
        disp('Save ur file in following folder');
        pwd
        disp(' import data using X= xlcread( file_name )camand ' )
    otherwise
        disp('Convert data into xlc sheet or enter it.')
        return
end

% check for input
[ nx mx ] = size(X);
if mx ~= 2
    error( ' Input error. Check the data')
    return
end

%check for the equispaced data
Y = diff( diff ( X(: ,1) )) ;
if Y ~= zeros( (nx-2), 1)
    disp('Data is not equi-spaced.This method can not be applied')
    return
end

% calculating value of h
H = diff( X(:,1));h = H(1,1);
% Trapezoidal formula
 I = h/2 * (2*sum( X(:,2))- X(1,2)- X( nx,2)); 
%displaying final result
disp(sprintf(' The integration from the given value is %10.6f .',I));
