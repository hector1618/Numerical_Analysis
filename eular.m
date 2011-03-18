function a= eular(  df )
% for calculating value of dy/dx at some perticular pt

% asking intial conditions
x0 = input(' initial value of x  :  ');
y0 = input ('initial value of y  :  ');
x1 = input( ' value of x at which y is to be calculated :  ');
h = input( 'desired lavel of accuracy in the final result   : ');

% calaulating the value of h
n =ceil( (x1-x0)/h);
h = ( x1 - x0)/n;

%loop for calculating values
for k = 1 : n
    X(1,1) = x0; Y (1,1) = y0;
    X( 1, k+1) = X(1,k) + h;
    Y( 1 ,k+1) = Y(1,k) + h* feval( df , X(1,k) , Y(1,k));% Eular's formula
end

%displaying results
fprintf( 'for x = %g \n y = %g \n' , x1,Y(1,n+1))

%displaying graph
x = 1:n+1;
y = Y(1,n+1)*ones(1,n+1) - Y(1,:);
plot(x,y,'g')
xlabel = (' no of intarval ');
ylabel = ( ' Error ');