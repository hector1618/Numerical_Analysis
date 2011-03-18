function a= eular(  df )
% for calculating value of dy/dx at some perticular pt using modifes

% asking intial conditions
x0 = input(' initial value of x  :  ');
y0 = input ('initial value of y  :  ');
x1 = input( ' value of x at which y is to be calculated :  ');
tol = input( 'desired lavel of accuracy in the final result   : ');

% calaulating the value of h
n =ceil( (x1-x0)/sqrt(tol));
h = ( x1 - x0)/n

%loop for calculating values
for k = 1 : n
    X(1,1) = x0; Y (1,1) = y0;
    X( 1, k+1) = X(1,k) + h;
    y_t = Y(1,k) + h* feval( df , X(1,k) , Y(1,k));% Eular's formula
    Y(1 ,k+1) = Y(1,k) + h/2* (feval( df , X(1,k) , Y(1,k)) + feval( df , X(1,k) + h , y_t ) ) ;
    %improving results obtained by modified Eular's formula
    while abs( Y(1,k+1) - y_t ) > h
        y_t = Y(1,k) + h*feval( df , X(1,k) , Y(1,k+1));
        Y( 1 ,k+1) = Y(1,k) + h/2* (feval( df , X(1,k) , Y(1,k)) + feval( df , X(1,k) + h , y_t ) );
    end
end

%displaying results
fprintf( 'for \t x = %g \n \ty = %g \n' , x1,Y(1,n+1))

%displaying graph
x = 1:n+1;
y = Y(1,n+1)*ones(1,n+1) - Y(1,:);
plot(x,y,'b')
xlabel = (' no of intarval ');
ylabel = ( ' Error ');