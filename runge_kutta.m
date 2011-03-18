function a = runge_kutta(df)
% for calculating value of y at given x when ode of 1st order is known by
% the method of Runge Kutta


% asking intial conditions
x0 = input(' initial value of x  :  ');
y0 = input ('initial value of y  :  ');
x1 = input( ' value of x at which y is to be calculated :  ');
tol = input( 'desired lavel of accuracy in the final result   : ');

%asking for the method
r = menu ( ' Which order of Runge Kutta u want to use', ...
                    ' 2nd order ' , ' 3rd order ' , ' 4th order ');

switch r
    case 1
        % calaulating the value of h
        n =ceil( (x1-x0)/sqrt(tol));
        h = ( x1 - x0)/n;
        for i = 1 : n
        X(1,1) = x0; Y (1,1) = y0;
        k1 = h*feval( df , X(1,i), Y(1,i));
        k2 = h*feval( df , X(1,i) + h , Y(1,i) + k1);
        k = 1/2* ( k1+ k2);
        X( 1, i+1) = X(1,i) + h;
        Y( 1 ,i+1) = Y(1,i) + k;
        end
        
    case 2
        % calaulating the value of h
        n =ceil( (x1-x0)/nthroot(tol,3));
        h = ( x1 - x0)/n;
        for i = 1 : n
        X(1,1) = x0; Y (1,1) = y0;
        k1 = h*feval( df , X(1,i),  Y(1,i));
        k2 = h*feval( df , X(1,i) + h/2, Y(1,i) + k1);
        k3 = h*feval( df , X(1,i) + h, Y(1,i) + k2);
        k = 1/6* ( k1+ 4*k2 + k3);
        X( 1, i+1) = X(1,i) + h;
        Y( 1 ,i+1) = Y(1,i) + k;
        end
        
    case 3
        % calaulating the value of h
        n =ceil( (x1-x0)/nthroot(tol,3));
        h = ( x1 - x0)/n;
        for i = 1 : n
        X(1,1) = x0; Y (1,1) = y0;
        k1 = h*feval( df , X(1,i),  Y(1,i));
        k2 = h*feval( df , X(1,i) + h/2, Y(1,i) + k1);
        k3 = h*feval( df , X(1,i) + h/2, Y(1,i) + k2);
        k4 = h*feval( df , X(1,i) + h, Y(1,i) + k3);
        k = 1/6* ( k1+ 2*k2 + 2*k3 + k4);
        X( 1, i+1) = X(1,i) + h;
        Y( 1 ,i+1) = Y(1,i) + k;
        end
        
end

%displaying results
fprintf( 'for x = %g \n y = %g \n' , x1,Y(1,n+1))

%displaying graph
x = 1:n+1;
y = Y(1,n+1)*ones(1,n+1) - Y(1,:);
plot(x,y,'r')
xlabel = (' no of intarval ');
ylabel = ( ' Error ');