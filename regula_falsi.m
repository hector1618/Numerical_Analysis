function a =  regula_falsi( f )
%for Regula Falsi mathod method
% f   is a funtion for which root to be found.

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
         feval( f , R(1,2)) == 0
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
 % no of itarations to be performed
 n = input('Pls inter the no of itaration to be performed   :');
 %initialising the value of k and matrix X 
 k=1;
 X= zeros(n+1,3);
 
 %initial disply of tabel & initialising values for look
disp(sprintf('\t iterate \t value of x  \t  error'));
x0= R(1,1); x1= R(1,2); x_disp= x0; err = x1-x0;
disp(sprintf ('\t %3d  \t  %11.5f      \t %11.5f  ', 0, x_disp,err));
% itaration loop starts
while k <=n  &&  abs(err) > tol 
  x = x1 - (x1-x0)/( feval(f,x1)-feval(f,x0) ) *feval(f,x1);%REGULA FALSI formula
        if feval(f , x0) * feval(f , x) == 0
            x
            return
        else
            if feval(f,x0) * feval(f,x) <0
            err = x - x1;
            x1 = x;
            x_disp=x1;
            X(k,2) = x1;
            else
            err = x-x0;
            x0 = x;
            x_disp = x0;
            X(k,2) = x0;
            end  
        end        
        % storing values in the form of matrix
        X(k,1) = k;
        X(k,3) = abs(err);
        disp(sprintf ('\t %3d  \t  %11.5f      \t %11.5f  ', k, x_disp,err));
        k = k + 1;
end
if abs(err) > tol
disp(sprintf ('The final answer abtained after %3d itarations is %10.10f with an error %10.10f \n' , n , X(n,2),X(n,3)))
disp('Try more no of itarations for desired accuracy') 
else
    disp(sprintf ('The final answer abtained after %3d itarations is %10.10f with an error %10.10f \n' , (k-1) , X((k-1),2),X((k-1),3)))
end


m = menu('would you like to see how process converges with itaration?',...
     'show in graphical form','No thanks..Get me out of this');
 switch m
     case 1
        x=X(1:(k-1),1);
        y=X(1:(k-1),3);
        plot(x,y)
        xlabel (' No of itarations ')
        ylabel (' Error ')
        title ('Convergence of Regula-Falsi methode')
        otherwise 
         return  
 end