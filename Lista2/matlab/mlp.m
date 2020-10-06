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

%define network and train
acc = zeros(1, 10);
for n = 1:10
    net = patternnet(20);
    net.trainParam.epochs = 100;
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