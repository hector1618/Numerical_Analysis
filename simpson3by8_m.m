function I = simpson3by8_m( X )
% for calculating intergrals using simpson's 3/8  rule when values are known

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
    error( ' Input error. Check the data');
    return
end
if rem(nx-1,3) ~= 0
    error( ' No of values known should be 3*N +1 . Use another method');
    return
end

%check for the equispaced data
Y = diff( diff ( X(: ,1) )) ;
if Y ~= zeros( (nx-2), 1)
    disp('Data is not equi-spaced.This method can not be applied')
    return
end

% calculating integration
k= 0; I1 = 0;
while 3*k+2 < nx
    I1 =  I1 + X ( 3*k+2 , 2 ) ;
    k = k +1;
end

j=1; I2 =0;
while 3*j  < nx
    I2 = I2 + X ( 3*j , 2);
    j = j + 1;
end

l=1; I3 = 0;
while 3*l + 1 < nx
    I3 = I3 + X( (3*l + 1) ,2 );
    l = l+1;
end
H = diff( X(:,1)); h = H(1,1);
I = 3*h/8 * (  X( 1,2) +  3*I1  +  3*I2 + 2*I3 +  X(nx,2)  ); %Simpson's 3/8 rule
%Display final result
 disp(sprintf(' The integration from the given value is %10.6f .',I));