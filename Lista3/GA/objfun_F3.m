function valor=objfun_F3(x)

% function
% f3(x1,x2,x3,x4,x5) = int(x1) + int(x2) + int(x3) + int(x4) + int(x5)  
% -5.12 <= xi <= 5.12

valor= floor(x(1)) + floor(x(2)) + floor(x(3)) + floor(x(4)) + floor(x(5));