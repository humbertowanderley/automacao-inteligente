%running ga in F2
gaDat2.Objfun='objfun_F2';
lb=[-2.048 -2.048];
ub=[2.048 2.048];
gaDat2.FieldD=[lb; ub];
gaDat2.MAXGEN=150;

v_Ind = [50, 200, 400];
v_Pc = [0.6, 0.6, 0.7];
v_Pm = [0.001, 0.2, 0.001];
v = [0,0,0,0,0,0,0,0,0,0];
avg = [0,0,0];
des = [0,0,0];

for i=1:3
    for j=1:10
        gaDat2.NIND= v_Ind(i);
        gaDat2.Pc= v_Pc(i);
        gaDat2.Pm= v_Pm(i);
                
        % Execute GA
        gaDat2=ga(gaDat2);
        % Result are in
        gaDat2.xmin
        gaDat2.fxmin
        
        v(j) = gaDat2.fxmin;
    end
    avg(i) = mean(v);
    des(i) = std(v);
end