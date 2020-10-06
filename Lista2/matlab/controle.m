clear;
pltc = 1;

%Planta
s = tf('s');
P = 1/(s^2 + 5*s + 1);

Kp = [1, 3, 7];
Ki = [1, 3, 7];
Kd = [1, 3, 7];
%P
for i = 1:length(Kp)
    C = pid(Kp(i));
    T = feedback(C*P,1);
    fig = figure(pltc);
    pltc = pltc+1;
    step(P, T);
    legend('Plant','P');
    title(sprintf("Step Response\nKp = %f", Kp(i)));
end

%PI
for i = 1:length(Kp)
    for j = 1:length(Ki)
        C = pid(Kp(i), Ki(j));
        T = feedback(C*P,1);
        figure(pltc);
        pltc = pltc+1;
        step(P, T);
        legend('Plant','PI');
        title(sprintf("Step Response\nKp = %f, Ki = %f", Kp(i), Ki(j)));
    end
end

%PD
for i = 1:length(Kp)
    for j = 1:length(Ki)
        C = pid(Kp(i), Kd(j));
        T = feedback(C*P,1);
        figure(pltc);
        pltc = pltc+1;
        step(P, T);
        legend('Plant','PD');
        title(sprintf("Step Response\nKp = %f, Kd = %f", Kp(i), Kd(j)));
    end
end

%PID
for i = 1:length(Kp)
    for j = 1:length(Ki)
        for k = 1:length(Kp)
            C = pid(Kp(i), Ki(j), Kd(k));
            T = feedback(C*P,1);
            figure(pltc);
            pltc = pltc+1;
            step(P, T);
            legend('Plant','PID');
            title(sprintf("Step Response\nKp = %f, Ki = %f, Kd = %f", Kp(i), Ki(j), Kd(k)));
        end
    end
end