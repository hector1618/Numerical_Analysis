function I = adams(f)
% for calculating value of y at given x when ode of 1st order is known by
% the Adam-Moulton's method
% Input argument is function f 


% asking intial conditions
x0 = input(' initial value of x  :  ');
y0 = input ('initial value of y  :  ');
x1 = input( ' value of x at which y is to be calculated :  ');
tol = input( 'desired lavel of accuracy in the final result is of an order : ');

%finding 4 previous values required for Milne's method using Runge Kutta
%method of 4th order

n =ceil( (x1-x0)/nthroot(tol,3));
h = ( x1 - x0)/n;
for i = 1 : n
X(1,1) = x0; Y (1,1) = y0;
k1 = h*feval( f , X(1,i),  Y(1,i));
k2 = h*feval( f , X(1,i) + h/2, Y(1,i) + k1);
k3 = h*feval( f , X(1,i) + h/2, Y(1,i) + k2);
k4 = h*feval( f , X(1,i) + h, Y(1,i) + k3);
k = 1/6* ( k1+ 2*k2 + 2*k3 + k4);
X( 1, i+1) = X(1,i) + h;
Y( 1 ,i+1) = Y(1,i) + k;
end

%Adam-Moulton's predictor formula
y_p = Y(1,n) + h/24*( 55*feval( f,X(1,n),Y(1,n)) - 59*feval( f, X(1,n-1),Y(1,n-1))...
                                    +37*feval( f,X(1,n-2),Y(1,n-2)) - 9*feval( f,X(1,n-3),Y(1,n-3)));
%Adam-Moulton's corrector formula
y_c = Y(1,n) + h/24*(9*feval(f,x1,y_p) + 19*feval( f, X(1,n),Y(1,n))...
                                    - 5*feval(f,X(1,n-1),Y(1,n-1)) + feval( f, X(1,n-2),Y(1,n-2)));
err  =  y_c - y_p;
%Applying corrector formula itaratively for better result
while  abs(err) > tol
    y_c1 = Y(1,n) + h/24*(9*feval(f,x1,y_c) + 19*feval( f, X(1,n),Y(1,n))...
                                    - 5*feval(f,X(1,n-1),Y(1,n-1)) + feval( f, X(1,n-2),Y(1,n-2)));
    err = y_c1 - y_c;
    y_c = y_c1;
end

% Displaying results
fprintf( 'for x = %g \n y = %g \n' , x1,y_c)