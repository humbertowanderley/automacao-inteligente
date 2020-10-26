function valor=objfun_F2(x)

% function
% f2(x1,x2) = 100(x1^2 - x2)^2 + (1-x1)^2 
% -2.048 <= xi <= 2.048

valor= 100*((x(1)^2 - x(2))^2) + (1-x(1))^2;