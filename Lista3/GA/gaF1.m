%running ga in F1
gaDat.Objfun='objfun_F1';
lb=[-5.12 -5.12];
ub=[5.12 5.12];
gaDat.FieldD=[lb; ub];
gaDat.MAXGEN=10;
gaDat.NIND=4000; % increasing number individuals produce better solution 
                 % but higher computational cost

                          
% Execute GA
gaDat=ga(gaDat);
% Result are in
gaDat.xmin
gaDat.fxmin