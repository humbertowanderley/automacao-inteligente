%running ga in F3
gaDat3.Objfun='objfun_F3';
lb=[-5.12 -5.12 -5.12 -5.12 -5.12];
ub=[5.12 5.12 5.12 5.12 5.12];
gaDat3.FieldD=[lb; ub];
gaDat3.MAXGEN=10;
gaDat3.NIND=40000; % increasing number individuals produce better solution 
                 % but higher computational cost

%gaDat3.indini= [0,0,0,0,0;
%                0.1,0.1,0.1,0.1,0.1;
%                -0.1,-0.1,-0.1,-0.1,-0.1]; 
                          
% Execute GA
gaDat3=ga(gaDat3);
% Result are in
gaDat3.xmin
gaDat3.fxmin