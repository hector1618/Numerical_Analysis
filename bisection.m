function a =  bisection( f )
% Bisection method
% The input is function ' f ' for which root is to be found
 
 % asking for the range
 R= input ( 'You are looking for the roots in   [ x_min , x_max]  :\n');
 %  check for range
 [ nr , mr ] = size( R);
 if nr ~= 1 || mr~= 2
     disp( 'Input error ..The matrix should be 1x2 matrix')
     return
 end


 % if roots lies on the boundary
 if feval( f , R( 1,1) )* feval( f , R(1,2)) == 0
    if feval( f , R( 1,1) ) == 0
        R(1,1)
        return
    else
         R(1,2)
         return
    end
 end
 
 % condition for convergence of method
 if feval( f , R( 1,1) )* feval( f , R(1,2)) > 0
     disp ( 'Either NO root lies in the in the given range or EVEN no of roots')
     disp( 'lies in the given range and hence this method can not be applied.');
     return
 end
 
 %error allowed in final answer
 tol = abs(input(' Pls enter the error allowed in the final answer  :'));
 %no of itarations required to attend error
 n = ceil (((log( R(1,2) - R(1,1) ) - log(tol )))/log (2));
 % initialising k and matrix
 k=0;
 X= zeros(n+1,4);
 % bisection loop starts
disp(sprintf('\t iterate \t lower_limit  \t upper limit  \t  error'));
x0= R(1,1); x1= R(1,2); err = x1-x0;
disp(sprintf ('\t %7d  \t  (%11.5f, \t %11.5f)  \t  %5.5f ', k, x0,x1, err ))
while (k <= n) 
  x = ( x0+ x1)/2;
err = ( x1-x0 );
       if feval( f , x0 ) * feval( f , x) == 0
          x
          return
       else       
            if feval(f,x0) * feval(f,x) > 0
            x0 = x;
            else
            x1 = x;
            end
       end
        % storing values in the form of matrix
        X(k+1,1) = k;
        X(k+1,2) = x0;
        X(k+1,3) = x1;
        X(k+1,4) = err;
        disp(sprintf ('\t %7d  \t  (%11.5f, \t %11.5f)  \t  %5.5f ', k, x0, x1, err ));
        k = k + 1;
        
end 

X(n+1,2)
 
 m = menu('would you like to see how process converges with itaration?',...
     'show in graphical form','No thanks..Get me out of this');
 switch m
     case 1
        x=X(:,1);y=X(:,4);
        plot(x,y)
        xlabel (' No of itarations ')
        ylabel (' Error ')
        title ('Convergence of bisection methode')
     otherwise 
         return
 end