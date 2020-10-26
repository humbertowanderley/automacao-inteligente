function quantify(image, img_name, results)
    %parameters

    param{1} = {100, 3, 'hextop', 'linkdist'};
    param{2} = {50, 3, 'hextop', 'linkdist'};
    param{3} = {100, 5, 'hextop', 'linkdist'};
    param{4} = {100, 3, 'randtop', 'linkdist'};
    param{5} = {100, 3, 'hextop', 'mandist'};
    
    %prepare data
    image_palette = zeros([3, size(image,1)*size(image,2)]);
    pos = 1;
    for i=1:size(image,1)
        for j=1:size(image,2)
            image_palette(:, pos) = double(reshape(image(i,j,:), 3, 1))/255.0;
            pos = pos+1;
        end
    end

    %run experiments
    fprintf(results, "$$$$$ %s experiments $$$$$\n", img_name);
    for n=2:6
        fprintf(results, "SOM dimensions: [%i, %i]\n", n, n);
        for p=1:size(param, 2)
            fprintf(results, "net parameters: %i %i %s %s\n", cell2mat(param{p}(1)), cell2mat(param{p}(2)), cell2mat(param{p}(3)), cell2mat(param{p}(4)));
            net = selforgmap([n, n], cell2mat(param{p}(1)), cell2mat(param{p}(2)), cell2mat(param{p}(3)), cell2mat(param{p}(4)));
            net.trainParam.epochs = 300;
            psnr_array = zeros([1, 10]);

            filename = sprintf("out\\%s\\%i\\%i_%i_%s_%s", img_name, n, cell2mat(param{p}(1)), cell2mat(param{p}(2)), cell2mat(param{p}(3)), cell2mat(param{p}(4)));
            mkdir(filename);
            for x=1:10
                [net,~] = train(net, image_palette);

                %get output from net
                w=net.IW{1};
                y = net(image_palette);

                %reassemble image
                image_quantized = zeros(size(image));
                pos = 1;
                for i=1:size(image,1)
                    for j=1:size(image,2)
                        image_quantized(i, j, :) = w(y(:,pos)==1, :);
                        pos = pos+1;
                    end
                end

                %psnr
                psnr_array(x) = psnr(image_quantized,double(image)/255.0);

                %save image to file
                filename = sprintf('out\\%s\\%i\\%i_%i_%s_%s\\%f.jpg', img_name, n, cell2mat(param{p}(1)), cell2mat(param{p}(2)), cell2mat(param{p}(3)), cell2mat(param{p}(4)), psnr_array(x));
                imwrite(image_quantized, filename);
            end
            fprintf(results, "psnr mean: %f\n", mean(psnr_array));
            fprintf(results, "psnr std: %f\n", std(psnr_array));
        end
        fprintf(results, "\n");
    end
    fprintf(results, "\n\n");
end