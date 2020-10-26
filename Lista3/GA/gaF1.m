%running ga in F1
gaDat.Objfun='objfun_F1';
lb=[-5.12 -5.12];
ub=[5.12 5.12];
gaDat.FieldD=[lb; ub];
gaDat.MAXGEN=150;

v_Ind = [50, 200, 400];
v_Pc = [0.6, 0.6, 0.7];
v_Pm = [0.001, 0.2, 0.001];
v = [0,0,0,0,0,0,0,0,0,0];
avg = [0,0,0];
des = [0,0,0];

for i=1:3
    for j=1:10
        gaDat.NIND= v_Ind(i);
        gaDat.Pc= v_Pc(i);
        gaDat.Pm= v_Pm(i);
                
        % Execute GA
        gaDat=ga(gaDat);
        % Result are in
        gaDat.xmin
        gaDat.fxmin
        
        v(j) = gaDat.fxmin;
    end
    avg(i) = mean(v);
    des(i) = std(v);
end
     