%Lista 3 - Algoritimo Genético(GA)

%Parte1 - Plote da func F1 do artigo
clear all
close all
yy=-5.12:0.1:5.12;
xx=-5.12:0.1:5.12;
for i=1:size(yy,2)
   for j=1:size(xx,2)
      z(i,j)=objfun_F1([xx(j),yy(i)]);
      x(i,j)=xx(j);
      y(i,j)=yy(i);
   end
end
figure(1)
surfc(x,y,z,'LineStyle','none','FaceColor','interp')

%Parte1 - Plote da func F2 do artigo
clear all
yy=-2.048:0.1:2.048;
xx=-2.048:0.1:2.048;
for i=1:size(yy,2)
   for j=1:size(xx,2)
      z(i,j)=objfun_F2([xx(j),yy(i)]);
      x(i,j)=xx(j);
      y(i,j)=yy(i);
   end
end
figure(2)
surfc(x,y,z,'LineStyle','none','FaceColor','interp')

%Parte1 - func F3(possui mais de 2 variáveis) plot não
%obrigatório.

