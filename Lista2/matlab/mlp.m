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
hiden_layer_size = [20 50];
training_funcions = ["trainscg" "traingdx"];
learning_rate = [0.1 0.5 1];
ephocs = [50 100];

cont = 0;
for param1 = 1:size(hiden_layer_size,2)
    for param2 = 1:size(training_funcions,2)
        for param3 = 1:size(learning_rate,2)
            for param4 = 1:size(ephocs,2)
                run_scenario(X, Y, hiden_layer_size(param1), training_funcions(param2), learning_rate(param3), ephocs(param4));
                cont = cont + 1;
            end
        end
    end
end

fprintf("Total de %d cenários avaliados.\n", cont);

function run_scenario(X, Y, layerSize, trainFunc, learningRate, ephoc)
    %define network and train
    fprintf("Treinando rede com os parâmetros:\n");
    fprintf("Tamanho da camada escondida: %d\n", layerSize);
    fprintf("Função de treinamento: %s\n", trainFunc);
    fprintf("Taxa de aprendizado: %f\n", learningRate);
    fprintf("Número de épocas: %d\n", ephoc);
    
    acc = zeros(1, 10);
    for n = 1:10
        net = patternnet(layerSize, char(trainFunc));
        net.trainParam.lr = learningRate;
        net.trainParam.epochs = ephoc;

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
    fprintf("-----------------------------------------------\n");
    
end

