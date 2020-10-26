%running ga in F3
gaDat3.Objfun='objfun_F3';
lb=[-5.12 -5.12 -5.12 -5.12 -5.12];
ub=[5.12 5.12 5.12 5.12 5.12];
gaDat3.FieldD=[lb; ub];
gaDat3.MAXGEN=1;

v_Ind = [50, 200, 400];
v_Pc = [0.6, 0.6, 0.7];
v_Pm = [0.001, 0.2, 0.001];
v = [0,0,0,0,0,0,0,0,0,0];
avg = [0,0,0];
des = [0,0,0];

for i=1:3
    for j=1:10
        gaDat3.NIND= v_Ind(i);
        gaDat3.Pc= v_Pc(i);
        gaDat3.Pm= v_Pm(i);
                
        % Execute GA
        gaDat3=ga(gaDat3);
        % Result are in
        gaDat3.xmin
        gaDat3.fxmin
        
        v(j) = gaDat3.fxmin;
    end
    avg(i) = mean(v);
    des(i) = std(v);
end
