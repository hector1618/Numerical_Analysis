function I = trapezoidal_f1 ( f )
% for calculating intergrals using trapezoidal rule when function is known

%asking for the range and desired accuracy
 R= input( ' Enter the limits of integrations [ x_min, x_max]   :\n');
 tol = input(' Error allowed in the final answer should be of an order : \n');
 a= R(1,1); b = R(1,2);
 
 %initial h and n
 n = 100;
 h = (b -a )/100;
 
 %for calculating maximum of h^2 *f''(x) in the given region
 for k = 0:100
        x( 1, k+1 ) = a +  k*h ;
        y2 ( 1, k+1) = feval ( f, x(1,k+1) + 2*h ) - 2*feval( f, x(1,k+1) + h ) + feval( f, x(k+1) );
 end 
 [ y i ] =  max( y2);
 x_opt = x(1,i);
   
 % for calculating the desired value of h
 m=0;
 while abs((feval ( f, x_opt + 2*h ) - 2*feval(f,  x_opt+ h) + feval(f, x_opt)) * ( b-a)/12) > tol % Global error for trapezoidal rule
                m = m +1;
                h = h * 10^-m;
 end
 
 %calculating  n
 n = ceil( (b-a)/h );
 h = ( b-a )/ n;

 % forming matrix X
 for k = 1:(n+1)
    X(k,1) = a + (k-1)*h;
    X(k,2) = feval( f, X(k,1));
 end
 
% trapezoidal formula
I = h/2 * (2*sum( X(:,2))- X(1,2)- X( n,2));
 % displaying final result
 h 
 n
 disp(sprintf(' Using this, integration for the given function in the range ( %10f , %10f )  is %10.6f .',a,b,I))