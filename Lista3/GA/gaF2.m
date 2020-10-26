%running ga in F2
gaDat2.Objfun='objfun_F2';
lb=[-2.048 -2.048];
ub=[2.048 2.048];
gaDat2.FieldD=[lb; ub];
gaDat2.MAXGEN=10;
gaDat2.NIND=40000; % increasing number individuals produce better solution 
                   % but higher computational cost

gaDat2.indini= [0,0;
                0.1,0.1;
                -0.1,-0.1];  % insert 3 individuals in the first population
           
% Execute GA
gaDat2=ga(gaDat2);
% Result are in
gaDat2.xmin
gaDat2.fxmin