function I = gauss_legendre(f)
% for calculating integration of a given function analatically using Gauss
% Legendre formula

%asking for the range and desired accuracy
 R= input( ' Enter the limits of integrations [ x_min, x_max]   :\n');
 a= R(1,1); b = R(1,2);
 
 r = menu ( 'Which formula you wnat to use?', ...
     ' Gauss 2 pt formula',' Gauss 3 pt formula' , ' Gauss 4 pt formula', ...
     ' Gauss 5 pt formula');
 switch r
     case 1
         t1 = -0.57735;
         x1= (b - a)/2*t1 + (b+a)/2;
         t2 =  0.57735;
         x2= (b - a)/2*t2 + (b+a)/2;
         I = feval( f , x1) +feval( f , x2);
     case 2
         t1 = -0.77460;
         x1= (b - a)/2*t1 + (b+a)/2;
         t2 =  0;
         x2= (b - a)/2*t2 + (b+a)/2;
         t3 =  0.77460;
         x3= (b - a)/2*t3 + (b+a)/2;
         I = 0.55555*feval( f , x1) + 0.88889*feval( f , x2) + 0.55555*feval(f, x3);
     case 3
         t1 = -0.86114;
         x1= (b - a)/2*t1 + (b+a)/2;
         t2 =  -0.33998;
         x2= (b - a)/2*t2 + (b+a)/2;
         t3 = 0.33998;
         x3= (b - a)/2*t3 + (b+a)/2;
         t4 = 0.86114;
         x4= (b - a)/2*t4 + (b+a)/2;
         I = 0.34786*feval( f , x1) + 0.65214*feval( f , x2) + 0.65214*feval(f, x3) + 0.34786*feval( f , x4);
     case 4
         t1 = -0.90618;
         x1= (b - a)/2*t1 + (b+a)/2;
         t2 =  -0.53847;
         x2= (b - a)/2*t2 + (b+a)/2;
         t3 =  0.00000;
         x3= (b - a)/2*t3 + (b+a)/2;
         t4 =  0.53847;
         x4= (b - a)/2*t2 + (b+a)/2;
         t5 = 0.90618;
         x5= (b - a)/2*t1 + (b+a)/2;
         I = 0.23693*feval( f , x1) + 0.47863*feval( f , x2) + 0.56889*feval(f, x3) + 0.47863*feval( f , x4) + 0.23693*feval(f , x5);
 end
 
 fprintf(' Integration of in the range [ %g , %g ] is %g ',a , b, I )
         
