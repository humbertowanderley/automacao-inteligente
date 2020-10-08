clear;

%load and prepare dataset
load ionosphere.mat; %https://archive.ics.uci.edu/ml/datasets/Ionosphere

Y = cell2mat(Y);
Y(Y=='b')=0;
Y(Y=='g')=1;
Y = double(Y);
Y = Y';
X = X';
Y(2,Y(1,:)==1)=0;
Y(2,Y(1,:)==0)=1;

%params
learning_rate = [0.1 0.5 1];
training_funcions = ["trainscg" "trainga" "traingd"];
hiden_layer_size = [10 20 50];
ephocs = [20, 50,100];


%define network and train
acc = zeros(1, 10);
for n = 1:10
    net = patternnet(hiden_layer_size(3), char(training_funcions(1)));
    net.trainParam.epochs = ephocs(3);
    net.trainParam.lr = learning_rate(1);
    [net,tr] = train(net,X,Y);
    
    %evaluate network
    testX = X(:,tr.testInd);
    testT = Y(:,tr.testInd);
    testY = net(testX);
    
    [c,cm] = confusion(testT,testY);
    acc(n) = 100*(1-c);
end
fprintf("taxa de acerto - média: %f\n", mean(acc));
fprintf("taxa de acerto - desvio padrão: %f\n", std(acc));
plotperform(tr);