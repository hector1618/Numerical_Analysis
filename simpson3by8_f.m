function I = simpson3by8_f ( f )
% for calculating intergrals using simpson's 3/8 rule when function is known
%asking for the range and desired accuracy
 R= input( ' Enter the limits of integrations [ x_min, x_max]   :\n');
 tol = input(' Error allowed in the final answer should be of an order : \n');
 a= R(1,1); b = R(1,2);
 
 %intial h and n
 n = 100;
 h = (b -a )/100;
 
 %for calculating maximum of f''''(x) in the given region
 for k = 0:100
        x( 1, k+1 ) = a +  k*h ;
        y4( 1, k+1) =    feval ( f, x(1,k+1) + 4*h ) - 4*feval( f, x(1,k+1) + 3*h )...
                                + 6*feval( f, x(k+1) + 2*h ) - 4* feval ( f, x(1,k+1) + h ) ...
                                + feval( f, x(k+1) );% fourth order difference
 end 
 [ y i ] =  max( y4);
 x_opt = x(1,i); 
 
 % for calculating the desired value of h
 m=0;
 ddf = feval ( f, x_opt + 4*h ) - 4*feval( f, x_opt + 3*h )...
        + 6*feval( f, x_opt + 2*h ) - 4* feval ( f, x_opt + h ) ...
        + feval( f, x_opt );% fourth order difference
 while ddf * ( b -a )/80 > tol % Global error for Simpson's 3by8 rule
                m = m +1;
                h = h*10^-m;
                 ddf = feval ( f, x_opt + 4*h ) - 4*feval( f, x_opt + 3*h )...
                           + 6*feval( f, x_opt + 2*h ) - 4* feval ( f, x_opt + h ) ...
                           + feval( f, x_opt );
 end
 % calculating n and modifiing h
 n = ceil(  (b-a)/h );
 if rem( n,3) == 0 
     n = n+1;
 end
 
 if rem( n,3) == 2
     n=n+2;
 end

 h = ( b-a )/n;

% calculating matrix X
 for k = 1:n
    X(k,1) = a + (k-1)*h;
    X(k,2) =feval ( f, X(k,1));
 end
 
 
% calculating integration
k= 0; I1 = 0;
while 3*k+2 < n
    I1 =  I1 + X ( 3*k+2 , 2 ) ;
    k = k +1;
end

j=1; I2 =0;
while 3*j  < n+1
    I2 = I2 + X ( 3*j , 2);
    j = j + 1;
end

l=1; I3 = 0;
while 3*l + 1 < n+1
    I3 = I3 + X( (3*l + 1) ,2 );
    l = l+1;
end

I = 3*h/8  * (  X( 1,2) +  3*I1  +  3*I2 + 2*I3 +  X(n,2)  ); %Simpson's 3/8 rule
% Display final result
h
n
disp(sprintf(' Using this integration for the given function in the range ( %3f , %3f )  is %10.6f .',a,b,I))
