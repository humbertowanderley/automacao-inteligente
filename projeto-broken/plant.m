clear;

theta = tf([-45.68 -1.298e-11 7.179e-13],[1 -3553e-15 -122.4 0 0], 0.1)
%phi = tf([80.05 -4.021e-12 61140], [1 -3.553e-15 -122.4 0 0], 0.1)


%C_theta =  pidtune(theta,'PID')
%T_theta = feedback(C_theta*theta,1)

%C_phi =  pidtune(phi,'PID')
%T_phi = feedback(C_phi*phi,1)

%pidTuner(theta,'PID')
u = rand([1,1000]);
[y,t]=lsim(theta,u);
y = mat2cell(y', 1000);

d1 = [1:2];
d2 = [1:2];
S1 = 5;
narx_net = narxnet(d1,d2,S1);
narx_net.divideFcn = '';
narx_net.inputs{1}.processFcns = {};
narx_net.inputs{2}.processFcns = {};
narx_net.outputs{2}.processFcns = {};
narx_net.trainParam.min_grad = 1e-10;
[p,Pi,Ai,t] = preparets(narx_net,u,{},y);
narx_net = train(narx_net,p,t,Pi);
narx_net_closed = closeloop(narx_net);
view(narx_net_closed)